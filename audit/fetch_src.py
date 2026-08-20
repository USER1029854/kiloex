import json,time,urllib.request,sys
KEY="R6PYYNEX4CNFAXX4YX3K8W4NXSBGGG4QGJ"
def get(chain,addr):
    url=f"https://api.etherscan.io/v2/api?chainid={chain}&module=contract&action=getsourcecode&address={addr}&apikey={KEY}"
    for _ in range(6):
        try:
            d=json.load(urllib.request.urlopen(url,timeout=30))
        except Exception as e:
            time.sleep(1.0); continue
        r=d.get('result')
        if isinstance(r,list): return r[0]
        # rate limited string
        time.sleep(1.2)
    return {}
targets=[
 ("8453","0x9ddb41dbbec00b04c6f3a4797cd67d225dfddbf7","fwd_curr_impl"),
 ("8453","0xbed75e25a63d2be11605038921aa5eef78bb4e61","fwd_vuln_impl"),
 ("8453","0xa307f7f990b7a94c803d4a1006b58c731e4b03e1","pf_exploit_impl"),
 ("8453","0x52cbc032124a96bd7ff9d031fe4510d4b2405a90","pf_curr_impl"),
 ("8453","0x844e8a8c20621136d53e102722544c1d44ddb8bb","router_impl"),
 ("8453","0x30865b2e57d3ced15f4174039d4002a2bd4a01de","vault_impl"),
]
for chain,addr,label in targets:
    r=get(chain,addr)
    sc=r.get('SourceCode','') if r else ''
    name=r.get('ContractName','') if r else ''
    print(f"{label:18s} {addr} verified={'Y' if sc else 'N'} name={name!r} srclen={len(sc)}")
    if sc:
        open(f"audit/base/{label}.sol","w").write(sc)
    time.sleep(0.5)
