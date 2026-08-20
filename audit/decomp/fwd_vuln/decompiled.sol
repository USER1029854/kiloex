// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

/// @title            Decompiled Contract
/// @author           Jonathan Becker <jonathan@jbecker.dev>
/// @custom:version   heimdall-rs v0.9.2
///
/// @notice           This contract was decompiled using the heimdall-rs decompiler.
///                     It was generated directly by tracing the EVM opcodes from this contract.
///                     As a result, it may not compile or even be valid solidity code.
///                     Despite this, it should be obvious what each function does. Overall
///                     logic should have been preserved throughout decompiling.
///
/// @custom:github    You can find the open-source decompiler here:
///                       https://heimdall.rs

contract DecompiledContract {
    mapping(bytes32 => bytes32) storage_map_d;
    bytes32 store_k;
    bytes32 store_n;
    uint256 public unresolved_2a71d166;
    uint256 public unresolved_cfc28b74;
    address public owner;
    address public newOwner;
    address public newGov;
    mapping(bytes32 => bytes32) storage_map_m;
    address public gov;
    uint256 public unresolved_4c1e69fd;
    address public quoteToken;
    bytes32 store_l;
    address store_i;
    
    event Event_f9d1d8b6();
    event Event_38f252aa();
    event Event_8a329754();
    event SetOwner(address);
    event SetGov(address);
    event Event_72605a8a();
    event Initialized(uint8);
    event Event_5e052633();
    event Event_eddf63bf();
    
    /// @custom:selector    0xccf2626f
    /// @custom:signature   Unresolved_ccf2626f(uint256 arg0, uint256 arg1, uint256 arg2) public pure
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    /// @param              arg1 ["uint256", "bytes32", "int256"]
    /// @param              arg2 ["uint256", "bytes32", "int256"]
    function Unresolved_ccf2626f(uint256 arg0, uint256 arg1, uint256 arg2) public pure {
        require((msg.data.length + 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc) < 0x60);
        require(arg0 > 0xffffffffffffffff);
        require(arg0 > 0xffffffffffffffff);
        require(arg1 > 0xffffffffffffffff);
        require(arg1 > 0xffffffffffffffff);
        require(arg2 > 0xffffffffffffffff);
    }
    
    /// @custom:selector    0xe366df60
    /// @custom:signature   Unresolved_e366df60(uint256 arg0) public payable
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    function Unresolved_e366df60(uint256 arg0) public payable {
        require(msg.value);
        require((msg.data.length + 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc) < 0x20, "OwnerGovernable: forbidden");
        require(!(msg.sender == (address(owner))), "OwnerGovernable: forbidden");
        unresolved_cfc28b74 = arg0;
        emit Event_f9d1d8b6(msg.sender, unresolved_cfc28b74, arg0);
    }
    
    /// @custom:selector    0xebbc4965
    /// @custom:signature   acceptOwner() public payable
    function acceptOwner() public payable {
        require(msg.value);
        require((msg.data.length + 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc) < 0);
        require(!(msg.sender == (address(newOwner))), "OwnerGovernable: not allowed");
        owner = (uint96(owner)) | (address(newOwner));
        newOwner = uint96(newOwner);
        emit SetOwner(address(newOwner));
    }
    
    /// @custom:selector    0x445b1e4b
    /// @custom:signature   approvedRouters(address arg0) public view returns (bool)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function approvedRouters(address arg0) public view returns (bool) {
        require(msg.value);
        require((msg.data.length + 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc) < 0x20);
        require(arg0 - (address(arg0)));
        address var_a = address(arg0);
        return !(!bytes1(storage_map_d[var_a]));
    }
    
    /// @custom:selector    0x13af4035
    /// @custom:signature   setOwner(address arg0) public payable returns (uint256)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function setOwner(address arg0) public payable returns (uint256) {
        require(msg.value);
        require((msg.data.length + 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc) < 0x20);
        require(arg0 - (address(arg0)));
        require(!(msg.sender == (address(gov >> 0x10))), "OwnerGovernable: forbidden");
        require(!(address(arg0)), "OwnerGovernable: zero address");
        newOwner = (uint96(newOwner)) | (address(arg0));
        return ;
    }
    
    /// @custom:selector    0x2d0335ab
    /// @custom:signature   getNonce(address arg0) public view returns (uint256)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function getNonce(address arg0) public view returns (uint256) {
        require(msg.value);
        require((msg.data.length + 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc) < 0x20);
        require(arg0 - (address(arg0)));
        address var_a = address(arg0);
        return storage_map_d[var_a];
    }
    
    /// @custom:selector    0x70d8174d
    /// @custom:signature   Unresolved_70d8174d(uint256 arg0) public payable
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    function Unresolved_70d8174d(uint256 arg0) public payable {
        require(msg.value);
        require((msg.data.length + 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc) < 0x20, "OwnerGovernable: forbidden");
        require(!(msg.sender == (address(owner))), "OwnerGovernable: forbidden");
        require(arg0 > unresolved_cfc28b74, "exceeds maximum maxQuoteGasFee");
        unresolved_4c1e69fd = arg0;
        emit Event_eddf63bf(msg.sender, unresolved_4c1e69fd, arg0);
    }
    
    /// @custom:selector    0xd19be62e
    /// @custom:signature   Unresolved_d19be62e(address arg0, address arg1) public payable returns (bytes memory)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    /// @param              arg1 ["address", "uint160", "bytes20", "int160"]
    function Unresolved_d19be62e(address arg0, address arg1) public payable returns (bytes memory) {
        require(msg.value);
        require((msg.data.length + 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc) < 0x40);
        require(arg0 - (address(arg0)));
        require(arg1 - (address(arg1)));
        var_a = address(arg1);
        address var_d = address(arg0);
        (bool success, bytes memory ret0) = address(quoteToken).Unresolved_70a08231(var_d); // staticcall
        (bool success, bytes memory ret0) = address(store_i).perpTradeAddr(); // staticcall
        var_d = address(arg0);
        (bool success, bytes memory ret0) = address(quoteToken).Unresolved_dd62ed3e(var_d); // staticcall
        (bool success, bytes memory ret0) = address(store_i).positionRouterAddr(); // staticcall
        var_d = address(arg0);
        (bool success, bytes memory ret0) = address(quoteToken).Unresolved_dd62ed3e(var_d); // staticcall
        (bool success, bytes memory ret0) = address(store_i).orderBookAddr(); // staticcall
        var_d = address(arg0);
        (bool success, bytes memory ret0) = address(quoteToken).Unresolved_dd62ed3e(var_d); // staticcall
        (bool success, bytes memory ret0) = address(store_i).productManagerAddr(); // staticcall
        var_d = address(arg0);
        (bool success, bytes memory ret0) = address(0).Unresolved_e72a2729(var_d); // staticcall
        var_d = address(arg1);
        (bool success, bytes memory ret0) = address(store_i).Unresolved_3d76750c(var_d); // staticcall
        return abi.encodePacked(unresolved_4c1e69fd, unresolved_2a71d166, storage_map_d[var_a], storage_map_d[var_a], 0, 0, 0, 0, 0, (address(arg0)) == 0);
        require(0x20 > ret0.length);
        require(((var_o + 0x20) > 0xffffffffffffffff) | ((var_o + 0x20) < var_o));
        var_a = 0x4e487b7100000000000000000000000000000000000000000000000000000000;
        uint256 var_o = var_o + 0x20;
        require(((var_o + 0x20) - var_o) < 0x20);
        require(var_o.length - (address(var_o.length)));
        return abi.encodePacked(unresolved_4c1e69fd, unresolved_2a71d166, storage_map_d[var_a], storage_map_d[var_a], 0, 0, 0, 0, 0, (address(arg0)) == (address(var_o.length)));
        if (0x20 > ret0.length) {
        }
        if (0x20 > ret0.length) {
        }
        if (0x20 > ret0.length) {
        }
        require(0x20 > ret0.length);
        require(((var_o + 0x20) > 0xffffffffffffffff) | ((var_o + 0x20) < var_o));
        var_a = 0x4e487b7100000000000000000000000000000000000000000000000000000000;
        var_o = var_o + 0x20;
        require(((var_o + 0x20) - var_o) < 0x20);
        require(var_o.length - (address(var_o.length)));
        var_e = address(arg0);
        uint256 var_r = address(var_o.length);
        (bool success, bytes memory ret0) = address(quoteToken).allowance(var_e, var_r); // staticcall
        (bool success, bytes memory ret0) = address(store_i).productManagerAddr(); // staticcall
        var_e = address(arg0);
        (bool success, bytes memory ret0) = address(0).accountFeeDiscount(var_e); // staticcall
        var_e = address(arg1);
        (bool success, bytes memory ret0) = address(store_i).originAccount(var_e); // staticcall
        return abi.encodePacked(unresolved_4c1e69fd, unresolved_2a71d166, storage_map_d[var_a], storage_map_d[var_a], 0, 0, 0, 0, 0, (address(arg0)) == 0);
        if (0x20 > ret0.length) {
        }
        if (0x20 > ret0.length) {
        }
        if (0x20 > ret0.length) {
        }
        if (0x20 > ret0.length) {
        }
        if (0x20 > ret0.length) {
        }
        if (0x20 > ret0.length) {
        }
        if (0x20 > ret0.length) {
        }
        if (0x20 > ret0.length) {
        }
        if (0x20 > ret0.length) {
        }
    }
    
    /// @custom:selector    0xbf5d3bdb
    /// @custom:signature   Unresolved_bf5d3bdb(uint256 arg0, uint256 arg1, uint256 arg2, uint256 arg3, uint256 arg4, uint256 arg5) public payable returns (bool)
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    /// @param              arg1 ["uint256", "bytes32", "int256"]
    /// @param              arg2 ["uint256", "bytes32", "int256"]
    /// @param              arg3 ["uint256", "bytes32", "int256"]
    /// @param              arg4 ["uint256", "bytes32", "int256"]
    /// @param              arg5 ["uint256", "bytes32", "int256"]
    function Unresolved_bf5d3bdb(uint256 arg0, uint256 arg1, uint256 arg2, uint256 arg3, uint256 arg4, uint256 arg5) public payable returns (bool) {
        require(msg.value);
        require((msg.data.length + 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc) < 0x40);
        require(arg0 > 0xffffffffffffffff);
        require(((msg.data.length - arg0) + 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc) < 0xc0);
        require(arg1 > 0xffffffffffffffff);
        require(!(arg1 + 0x23) < msg.data.length);
        require(arg1 > 0xffffffffffffffff);
        require(((arg1 + (arg1)) + 0x24) > msg.data.length);
        require(arg0 - (address(arg0)));
        require((arg0 + 0x20) - (address(arg0 + 0x20)));
        require(arg0 + (arg0 + 0xa0) > 0xffffffffffffffff);
        require(arg0 + (arg0 + 0xa0) > 0xffffffffffffffff);
        require(((var_c + (uint248((0x20 + (0x1f + (arg0 + (arg0 + 0xa0)))) + 0x1f))) > 0xffffffffffffffff) | ((var_c + (uint248((0x20 + (0x1f + (arg0 + (arg0 + 0xa0)))) + 0x1f))) < var_c));
        uint256 var_c = var_c + (uint248((0x20 + (0x1f + (arg0 + (arg0 + 0xa0)))) + 0x1f));
        var_e = msg.data[36:36];
        require(((var_c + 0x0100) > 0xffffffffffffffff) | ((var_c + 0x0100) < var_c));
        var_c = var_c + 0x0100;
        require(((var_c + 0x01c0) > 0xffffffffffffffff) | ((var_c + 0x01c0) < (var_c + 0x0100)));
        var_c = var_c + 0x01c0;
        require((((var_c + 0x01c0) + 0x80) > 0xffffffffffffffff) | (((var_c + 0x01c0) + 0x80) < (var_c + 0x01c0)));
        var_c = (var_c + 0x01c0) + 0x80;
        require(arg1 > 0xffffffffffffffff);
        require(((var_c + (uint248((0x20 + (0x1f + (arg1))) + 0x1f))) > 0xffffffffffffffff) | ((var_c + (uint248((0x20 + (0x1f + (arg1))) + 0x1f))) < var_c));
        var_c = var_c + (uint248((0x20 + (0x1f + (arg1))) + 0x1f));
        uint256 var_y = (arg1);
        require((0x24 + arg1) + var_y > msg.data.length);
        var_e = msg.data[36:36];
        require(0 == (var_c.length == 0x41));
        require(var_aa > 0x7fffffffffffffffffffffffffffffff5d576e7357a4501ddfe92f46681b20a0);
        require(!0x03 < 0x05);
        require(0x03);
        require(arg0 - (address(arg0)));
        uint256 var_a = address(arg0);
        uint256 var_ab = 0x6a;
        require(storage_map_d[var_a] == (arg0 + 0x80), "ECDSA: invalid signature");
        return !(!storage_map_d[var_a] == (arg0 + 0x80));
        require(0x02, "ECDSA: invalid signature");
        require(0x01, "ECDSA: invalid signature length");
        require(0, "ECDSA: invalid signature 'v' value");
        require(0x04 == 0x03, "ECDSA: invalid signature 'v' value");
        require(!(bytes1(var_ag)) == 0x1b);
        require(!(bytes1(var_ag)) == 0x1b);
        address var_a = ecrecover(keccak256(var_ah), bytes1(var_ag), var_e, var_aa);
        require(!var_ab);
        if (!address(var_a)) {
        }
    }
    
    /// @custom:selector    0xcfad57a2
    /// @custom:signature   setGov(address arg0) public payable returns (uint256)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function setGov(address arg0) public payable returns (uint256) {
        require(msg.value);
        require((msg.data.length + 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc) < 0x20);
        require(arg0 - (address(arg0)));
        require(!(msg.sender == (address(gov >> 0x10))), "OwnerGovernable: forbidden");
        require(!(address(arg0)), "OwnerGovernable: zero address");
        newGov = (uint96(newGov)) | (address(arg0));
        return ;
    }
    
    /// @custom:selector    0x94100086
    /// @custom:signature   Unresolved_94100086(address arg0, uint256 arg1) public payable
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    /// @param              arg1 ["uint256", "bytes32", "int256"]
    function Unresolved_94100086(address arg0, uint256 arg1) public payable {
        require(msg.value);
        require((msg.data.length + 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc) < 0x40);
        require(arg0 - (address(arg0)));
        require(!(msg.sender == (address(owner))), "OwnerGovernable: forbidden");
        address var_c = address(arg0);
        var_a = 0x44;
        require(((var_f + 0x80) > 0xffffffffffffffff) | ((var_f + 0x80) < var_f), "Address: call to non-contract");
        uint256 var_f = var_f + 0x80;
        require(((var_f + 0x40) > 0xffffffffffffffff) | ((var_f + 0x40) < var_f), "Address: call to non-contract");
        var_f = var_f + 0x40;
        require(!(address(quoteToken).code.length), "Address: call to non-contract");
        (bool success, bytes memory ret0) = address(quoteToken).{ value: 0 ether }Unresolved_a9059cbb(var_c); // call
        require(!ret0.length);
        require(!var_o);
        require(var_o, "SafeERC20: ERC20 operation did not succeed");
        require(((0x60 + var_o) - 0x60) < 0x20, "SafeERC20: ERC20 operation did not succeed");
        require(var_a - var_a, "SafeERC20: ERC20 operation did not succeed");
        require(!var_a, "SafeERC20: ERC20 operation did not succeed");
        emit Event_5e052633(msg.sender, address(arg0), arg1);
        emit Event_5e052633(msg.sender, address(arg0), arg1);
        require(ret0.length > 0xffffffffffffffff);
        require(((var_f + (uint248((0x20 + (0x1f + ret0.length)) + 0x1f))) > 0xffffffffffffffff) | ((var_f + (uint248((0x20 + (0x1f + ret0.length)) + 0x1f))) < var_f));
        var_f = var_f + (uint248((0x20 + (0x1f + ret0.length)) + 0x1f));
        require(!var_f.length);
        require(var_f.length);
        emit Event_5e052633(msg.sender, address(arg0), arg1);
    }
    
    /// @custom:selector    0x6ba42aaa
    /// @custom:signature   isKeeper(address arg0) public view returns (bool)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function isKeeper(address arg0) public view returns (bool) {
        require(msg.value);
        require((msg.data.length + 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc) < 0x20);
        require(arg0 - (address(arg0)));
        address var_a = address(arg0);
        return !(!bytes1(storage_map_d[var_a]));
    }
    
    /// @custom:selector    0xd5eebede
    /// @custom:signature   Unresolved_d5eebede(address arg0, uint256 arg1) public payable
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    /// @param              arg1 ["uint256", "bytes32", "int256"]
    function Unresolved_d5eebede(address arg0, uint256 arg1) public payable {
        require(msg.value);
        require((msg.data.length + 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc) < 0x40);
        require(arg0 - (address(arg0)));
        require(arg1 - arg1);
        require(!(msg.sender == (address(owner))), "OwnerGovernable: forbidden");
        address var_e = address(arg0);
        storage_map_m[var_e] = (bytes1(arg1)) | (uint248(storage_map_m[var_e]));
        emit Event_38f252aa(msg.sender, address(arg0), arg1);
    }
    
    /// @custom:selector    0x47153f82
    /// @custom:signature   Unresolved_47153f82(uint256 arg0, uint256 arg1, uint256 arg2, uint256 arg3, uint256 arg4, uint256 arg5) public payable
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    /// @param              arg1 ["uint256", "bytes32", "int256"]
    /// @param              arg2 ["uint256", "bytes32", "int256"]
    /// @param              arg3 ["uint256", "bytes32", "int256"]
    /// @param              arg4 ["uint256", "bytes32", "int256"]
    /// @param              arg5 ["uint256", "bytes32", "int256"]
    function Unresolved_47153f82(uint256 arg0, uint256 arg1, uint256 arg2, uint256 arg3, uint256 arg4, uint256 arg5) public payable {
        require((msg.data.length + 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc) < 0x40);
        require(arg0 > 0xffffffffffffffff);
        require(((msg.data.length - arg0) + 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc) < 0xc0);
        require(arg1 > 0xffffffffffffffff);
        require(!(arg1 + 0x23) < msg.data.length);
        require(arg1 > 0xffffffffffffffff);
        require(((arg1 + (arg1)) + 0x24) > msg.data.length);
        require(arg0 - (address(arg0)));
        require((arg0 + 0x20) - (address(arg0 + 0x20)));
        require(arg0 + (arg0 + 0xa0) > 0xffffffffffffffff);
        require(arg0 + (arg0 + 0xa0) > 0xffffffffffffffff);
        require(((var_c + (uint248((0x20 + (0x1f + (arg0 + (arg0 + 0xa0)))) + 0x1f))) > 0xffffffffffffffff) | ((var_c + (uint248((0x20 + (0x1f + (arg0 + (arg0 + 0xa0)))) + 0x1f))) < var_c));
        uint256 var_c = var_c + (uint248((0x20 + (0x1f + (arg0 + (arg0 + 0xa0)))) + 0x1f));
        var_e = msg.data[36:36];
        require(((var_c + 0x0100) > 0xffffffffffffffff) | ((var_c + 0x0100) < var_c));
        var_c = var_c + 0x0100;
        require(((var_c + 0x01c0) > 0xffffffffffffffff) | ((var_c + 0x01c0) < (var_c + 0x0100)));
        var_c = var_c + 0x01c0;
        require((((var_c + 0x01c0) + 0x80) > 0xffffffffffffffff) | (((var_c + 0x01c0) + 0x80) < (var_c + 0x01c0)));
        var_c = (var_c + 0x01c0) + 0x80;
        require(arg1 > 0xffffffffffffffff);
        require(((var_c + (uint248((0x20 + (0x1f + (arg1))) + 0x1f))) > 0xffffffffffffffff) | ((var_c + (uint248((0x20 + (0x1f + (arg1))) + 0x1f))) < var_c));
        var_c = var_c + (uint248((0x20 + (0x1f + (arg1))) + 0x1f));
        uint256 var_y = (arg1);
        require((0x24 + arg1) + var_y > msg.data.length);
        var_e = msg.data[36:36];
        require(0 == (var_c.length == 0x41));
        require(var_aa > 0x7fffffffffffffffffffffffffffffff5d576e7357a4501ddfe92f46681b20a0);
        require(!0x03 < 0x05);
        require(0x03);
        require(arg0 - (address(arg0)));
        uint256 var_a = address(arg0);
        uint256 var_ab = 0x6a;
        require(storage_map_d[var_a] == (arg0 + 0x80), "MinimalForwarder: signature does not match request");
        require(!(storage_map_d[var_a] == (arg0 + 0x80)), "MinimalForwarder: signature does not match request");
        require((arg0 + 0x80) > ((arg0 + 0x80) + 0x01), "ECDSA: invalid signature");
        require(0x02, "ECDSA: invalid signature");
        require(0x01, "ECDSA: invalid signature length");
        require(0, "ECDSA: invalid signature 'v' value");
        require(0x04 == 0x03, "ECDSA: invalid signature 'v' value");
        require(!(bytes1(var_ag)) == 0x1b);
        require(!(bytes1(var_ag)) == 0x1b);
        address var_a = ecrecover(keccak256(var_ah), bytes1(var_ag), var_e, var_aa);
        require(!var_ab);
        if (!address(var_a)) {
        }
    }
    
    /// @custom:selector    0x7bc6729b
    /// @custom:signature   acceptGov() public payable
    function acceptGov() public payable {
        require(msg.value);
        require((msg.data.length + 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc) < 0);
        require(!(msg.sender == (address(newGov))), "OwnerGovernable: not allowed");
        gov = (uint96(gov)) | (address(newGov << 0x10));
        newGov = uint96(newGov);
        emit SetGov(address(uint96(gov) | (newGov << 0x10) >> 0x10));
    }
    
    /// @custom:selector    0x6c28e349
    /// @custom:signature   initialize(address arg0, uint256 arg1, uint256 arg2, uint256 arg3, address arg4) public payable
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    /// @param              arg1 ["uint256", "bytes32", "int256"]
    /// @param              arg2 ["uint256", "bytes32", "int256"]
    /// @param              arg3 ["uint256", "bytes32", "int256"]
    /// @param              arg4 ["address", "uint160", "bytes20", "int160"]
    function initialize(address arg0, uint256 arg1, uint256 arg2, uint256 arg3, address arg4) public payable {
        require(msg.value);
        require((msg.data.length + 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc) < 0xa0);
        require(arg0 - (address(arg0)));
        require(arg4 - (address(arg4)));
        require(!(bytes1(gov >> 0x08)), "invalid gas fee");
        require(!(!bytes1(gov >> 0x08)), "invalid gas fee");
        require(address(this).code.length, "invalid gas fee");
        require(!(0x01 == (bytes1(gov))), "invalid gas fee");
        gov = (uint248(gov)) | 0x01;
        require(!(bytes1(gov >> 0x08)), "invalid gas fee");
        require(arg1 > arg2, "invalid gas fee");
        require(!(bytes1(gov >> 0x08)), "Initializable: contract is already initialized");
        require(!(!bytes1(gov >> 0x08)), "Initializable: contract is already initialized");
        require(address(this).code.length, "Initializable: contract is already initialized");
        require(!(0x01 == (bytes1(gov))), "Initializable: contract is already initialized");
        gov = (uint248(gov)) | 0x01;
        require(!(bytes1(gov >> 0x08)), "Initializable: contract is not initializing");
        gov = (uint96(gov)) | (address(msg.sender << 0x10));
        owner = (uint96(owner)) | msg.sender;
        require(!(bytes1(gov >> 0x08)), "Initializable: contract is not initializing");
        require(!(bytes1(gov >> 0x08)), "Initializable: contract is not initializing");
        require(!(bytes1(gov >> 0x08)), "Initializable: contract is not initializing");
        store_n = 0x01;
        require(!(bytes1(gov >> 0x08)), "Initializable: contract is not initializing");
        require(((var_f + 0x40) > 0xffffffffffffffff) | ((var_f + 0x40) < var_f), "Initializable: contract is not initializing");
        uint256 var_f = var_f + 0x40;
        require(((var_f + 0x40) > 0xffffffffffffffff) | ((var_f + 0x40) < var_f), "Initializable: contract is not initializing");
        require(!(bytes1(gov >> 0x08)), "Initializable: contract is not initializing");
        store_k = keccak256(var_l);
        store_l = keccak256(var_l);
        quoteToken = (uint96(quoteToken)) | (address(arg0));
        unresolved_4c1e69fd = arg1;
        unresolved_cfc28b74 = arg2;
        unresolved_2a71d166 = arg3;
        store_i = (uint96(store_i)) | (address(arg4));
        require(!(bytes1(gov >> 0x08)), "Initializable: contract is not initializing");
        gov = uint248(gov);
        emit Initialized(0x01);
        require(address(this).code.length, "Initializable: contract is already initialized");
        if (!(gov) < 0x01) {
        }
    }
    
    /// @custom:selector    0x2b3102be
    /// @custom:signature   Unresolved_2b3102be(uint256 arg0, uint256 arg1, uint256 arg2, uint256 arg3, uint256 arg4, uint256 arg5) public payable
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    /// @param              arg1 ["uint256", "bytes32", "int256"]
    /// @param              arg2 ["uint256", "bytes32", "int256"]
    /// @param              arg3 ["uint256", "bytes32", "int256"]
    /// @param              arg4 ["uint256", "bytes32", "int256"]
    /// @param              arg5 ["uint256", "bytes32", "int256"]
    function Unresolved_2b3102be(uint256 arg0, uint256 arg1, uint256 arg2, uint256 arg3, uint256 arg4, uint256 arg5) public payable {
        require((msg.data.length + 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc) < 0x40);
        require(arg0 > 0xffffffffffffffff);
        require(((msg.data.length - arg0) + 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc) < 0xc0);
        require(arg1 > 0xffffffffffffffff);
        require(!(arg1 + 0x23) < msg.data.length);
        require(arg1 > 0xffffffffffffffff);
        require(((arg1 + (arg1)) + 0x24) > msg.data.length, "ReentrancyGuard: reentrant call");
        require(!(!store_n == 0x02), "ReentrancyGuard: reentrant call");
        store_n = 0x02;
        require((arg0 + 0x20) - (address(arg0 + 0x20)));
        uint256 var_e = address(arg0 + 0x20);
        require(bytes1(storage_map_m[var_e]));
        var_e = msg.sender;
        require(!bytes1(storage_map_m[var_e]));
        require(arg0 - (address(arg0)));
        require((arg0 + 0x20) - (address(arg0 + 0x20)));
        require(arg0 + (arg0 + 0xa0) > 0xffffffffffffffff);
        require(arg0 + (arg0 + 0xa0) > 0xffffffffffffffff);
        require(((var_h + (uint248((0x20 + (0x1f + (arg0 + (arg0 + 0xa0)))) + 0x1f))) > 0xffffffffffffffff) | ((var_h + (uint248((0x20 + (0x1f + (arg0 + (arg0 + 0xa0)))) + 0x1f))) < var_h));
        uint256 var_h = var_h + (uint248((0x20 + (0x1f + (arg0 + (arg0 + 0xa0)))) + 0x1f));
        var_i = msg.data[36:36];
        require(((var_h + 0x0100) > 0xffffffffffffffff) | ((var_h + 0x0100) < var_h));
        var_h = var_h + 0x0100;
        require(((var_h + 0x01c0) > 0xffffffffffffffff) | ((var_h + 0x01c0) < (var_h + 0x0100)));
        var_h = var_h + 0x01c0;
        require((((var_h + 0x01c0) + 0x80) > 0xffffffffffffffff) | (((var_h + 0x01c0) + 0x80) < (var_h + 0x01c0)));
        var_h = (var_h + 0x01c0) + 0x80;
        require(arg1 > 0xffffffffffffffff);
        require(((var_h + (uint248((0x20 + (0x1f + (arg1))) + 0x1f))) > 0xffffffffffffffff) | ((var_h + (uint248((0x20 + (0x1f + (arg1))) + 0x1f))) < var_h));
        var_h = var_h + (uint248((0x20 + (0x1f + (arg1))) + 0x1f));
        uint256 var_ac = (arg1);
        require((0x24 + arg1) + var_ac > msg.data.length);
        var_i = msg.data[36:36];
        require(0 == (var_h.length == 0x41));
        require(var_ae > 0x7fffffffffffffffffffffffffffffff5d576e7357a4501ddfe92f46681b20a0);
        require(!0x03 < 0x05);
        require(0x03);
        require(arg0 - (address(arg0)));
        var_e = address(arg0);
        var_f = 0x6a;
        require(storage_map_m[var_e] == (arg0 + 0x80), "MinimalForwarder: signature does not match request");
        require(!(storage_map_m[var_e] == (arg0 + 0x80)), "MinimalForwarder: signature does not match request");
        require((arg0 + 0x80) > ((arg0 + 0x80) + 0x01), "ECDSA: invalid signature");
        require(0x02, "ECDSA: invalid signature");
        require(0x01, "ECDSA: invalid signature length");
        require(0, "ECDSA: invalid signature 'v' value");
        require(0x04 == 0x03, "ECDSA: invalid signature 'v' value");
        require(!(bytes1(var_aj)) == 0x1b);
        require(!(bytes1(var_aj)) == 0x1b);
        address var_e = ecrecover(keccak256(var_ak), bytes1(var_aj), var_i, var_ae);
        require(!var_f);
        if (!address(var_e)) {
        }
    }
    
    /// @custom:selector    0x67b012ce
    /// @custom:signature   Unresolved_67b012ce(uint256 arg0) public payable
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    function Unresolved_67b012ce(uint256 arg0) public payable {
        require(msg.value);
        require((msg.data.length + 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc) < 0x20, "OwnerGovernable: forbidden");
        require(!(msg.sender == (address(owner))), "OwnerGovernable: forbidden");
        unresolved_2a71d166 = arg0;
        emit Event_8a329754(msg.sender, unresolved_2a71d166, arg0);
    }
    
    /// @custom:selector    0x7134f04e
    /// @custom:signature   Unresolved_7134f04e(uint256 arg0, address arg1) public view returns (bytes memory)
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    /// @param              arg1 ["address", "uint160", "bytes20", "int160"]
    function Unresolved_7134f04e(uint256 arg0, address arg1) public view returns (bytes memory) {
        require(msg.value);
        require((msg.data.length + 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc) < 0x20);
        require(arg0 > 0xffffffffffffffff);
        require(arg0 > 0xffffffffffffffff);
        require(arg0 > 0xffffffffffffffff);
        require(((var_c + (uint248((0x20 + (arg0 << 0x05)) + 0x1f))) > 0xffffffffffffffff) | ((var_c + (uint248((0x20 + (arg0 << 0x05)) + 0x1f))) < var_c));
        uint256 var_c = var_c + (uint248((0x20 + (arg0 << 0x05)) + 0x1f));
        require(arg0 > 0xffffffffffffffff);
        require(0 < (arg0));
        require(!0 < (arg0));
        require((0 + (arg0 + 0x20)) - (address(0 + (arg0 + 0x20))));
        uint256 var_a = address(0 + (arg0 + 0x20));
        require(0 == 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff);
        return abi.encodePacked(0x20, var_c.length);
    }
    
    /// @custom:selector    0xd1b9e853
    /// @custom:signature   Unresolved_d1b9e853(address arg0, uint256 arg1) public payable
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    /// @param              arg1 ["uint256", "bytes32", "int256"]
    function Unresolved_d1b9e853(address arg0, uint256 arg1) public payable {
        require(msg.value);
        require((msg.data.length + 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc) < 0x40);
        require(arg0 - (address(arg0)));
        require(arg1 - arg1);
        require(!(msg.sender == (address(owner))), "OwnerGovernable: forbidden");
        address var_e = address(arg0);
        storage_map_m[var_e] = (bytes1(arg1)) | (uint248(storage_map_m[var_e]));
        emit Event_72605a8a(msg.sender, address(arg0), arg1);
    }
    
    /// @custom:selector    0xef0a2e36
    /// @custom:signature   Unresolved_ef0a2e36(uint256 arg0, uint256 arg1, uint256 arg2) public pure
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    /// @param              arg1 ["uint256", "bytes32", "int256"]
    /// @param              arg2 ["uint256", "bytes32", "int256"]
    function Unresolved_ef0a2e36(uint256 arg0, uint256 arg1, uint256 arg2) public pure {
        require((msg.data.length + 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc) < 0x60);
        require(arg0 > 0xffffffffffffffff);
        require(arg0 > 0xffffffffffffffff);
        require(arg1 > 0xffffffffffffffff);
        require(arg1 > 0xffffffffffffffff);
        require(arg2 > 0xffffffffffffffff);
    }
}