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
    address public positionRouter;
    bytes32 store_a;
    bytes32 store_c;
    mapping(bytes32 => bytes32) storage_map_d;
    address public unresolved_7f5ddd4c;
    bool public unresolved_24167157;
    uint256 public unresolved_191140d7;
    address public perpTrade;
    bytes32 store_i;
    
    
    /// @custom:selector    0xd0b9ff99
    /// @custom:signature   Unresolved_d0b9ff99(uint256 arg0, uint256 arg1, uint256 arg2, uint256 arg3, uint256 arg4, address arg5) public payable
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    /// @param              arg1 ["uint256", "bytes32", "int256"]
    /// @param              arg2 ["uint256", "bytes32", "int256"]
    /// @param              arg3 ["uint256", "bytes32", "int256"]
    /// @param              arg4 ["uint256", "bytes32", "int256"]
    /// @param              arg5 ["address", "uint160", "bytes20", "int160"]
    function Unresolved_d0b9ff99(uint256 arg0, uint256 arg1, uint256 arg2, uint256 arg3, uint256 arg4, address arg5) public payable {
        require((msg.data.length + 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc) < 0xc0);
        require(arg0 > 0xffffffffffffffff);
        require(arg0 > 0xffffffffffffffff);
        require(arg1 > 0xffffffffffffffff);
        require(arg1 > 0xffffffffffffffff);
        require(arg2 > 0xffffffffffffffff);
        require(arg2 > 0xffffffffffffffff);
        require(arg3 > 0xffffffffffffffff);
        require(arg3 > 0xffffffffffffffff);
        require(arg4 > 0xffffffffffffffff);
        require(arg4 > 0xffffffffffffffff);
        require(arg5 - (address(arg5)));
        require(!(msg.sender == (address(store_a))), "DelegateCollection: not trustedForwarder");
        address var_b = tx.origin;
        (bool success, bytes memory ret0) = address(store_a).Unresolved_6ba42aaa(var_b); // staticcall
        require(!0);
        require(arg1 > 0xffffffffffffffff);
        require(((var_h + (uint248((0x20 + (arg1 << 0x05)) + 0x1f))) > 0xffffffffffffffff) | ((var_h + (uint248((0x20 + (arg1 << 0x05)) + 0x1f))) < var_h));
        uint256 var_h = var_h + (uint248((0x20 + (arg1 << 0x05)) + 0x1f));
        require(arg1 > 0xffffffffffffffff);
        require(0 < (arg1));
        require(!0 < (arg1));
        require((0 + (arg1 + 0x20)) - (address(0 + (arg1 + 0x20))));
        uint256 var_c = address(0 + (arg1 + 0x20));
        (bool success, bytes memory ret0) = address(positionRouter).Unresolved_633451de(var_c); // staticcall
        require(!0 < (arg2));
        require((0 - (0 + (arg2 + 0x20))) > 0);
        require(0x20 > ret0.length);
        require(((var_h + 0x20) > 0xffffffffffffffff) | ((var_h + 0x20) < var_h));
        var_h = var_h + 0x20;
        require(((var_h + 0x20) - var_h) < 0x20);
        require(!(0 < (arg2)), "DelegateCollection: not keeper");
        if (0x20 > ret0.length) {
        }
    }
    
    /// @custom:selector    0x485cc955
    /// @custom:signature   initialize(address arg0, address arg1) public payable
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    /// @param              arg1 ["address", "uint160", "bytes20", "int160"]
    function initialize(address arg0, address arg1) public payable {
        require(msg.value);
        require((msg.data.length + 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc) < 0x40);
        require(arg0 - (address(arg0)));
        require(arg1 - (address(arg1)));
        require(!(bytes1(store_c >> 0x08)), "Initializable: contract is not initializing");
        require(!(!bytes1(store_c >> 0x08)), "Initializable: contract is not initializing");
        require(address(this).code.length, "Initializable: contract is not initializing");
        require(!(bytes1(store_c) == 0x01), "Initializable: contract is not initializing");
        store_c = (uint248(store_c)) | 0x01;
        require(!(bytes1(store_c >> 0x08)), "Initializable: contract is not initializing");
        require(!(bytes1(store_c >> 0x08)), "Initializable: contract is not initializing");
        store_c = 0x0101 | (uint240(store_c));
        require(!(bytes1(store_c >> 0x08)), "Initializable: contract is not initializing");
        require(!(!bytes1(store_c >> 0x08)), "Initializable: contract is already initialized");
    }
    
    /// @custom:selector    0x3bbd64bc
    /// @custom:signature   keepers(address arg0) public view returns (bool)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function keepers(address arg0) public view returns (bool) {
        require(msg.value);
        require((msg.data.length + 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc) < 0x20);
        require(arg0 - (address(arg0)));
        address var_a = address(arg0);
        return !(!bytes1(storage_map_d[var_a]));
    }
    
    /// @custom:selector    0x2989c28a
    /// @custom:signature   Unresolved_2989c28a(uint256 arg0, address arg1, uint256 arg2, uint256 arg3) public payable returns (uint256)
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    /// @param              arg1 ["address", "uint160", "bytes20", "int160"]
    /// @param              arg2 ["uint256", "bytes32", "int256"]
    /// @param              arg18446744073709551615 ["uint256", "bytes32", "int256"]
    function Unresolved_2989c28a(uint256 arg0, address arg1, uint256 arg2, uint256 arg3) public payable returns (uint256) {
        require(msg.value);
        require((msg.data.length + 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc) < 0x60);
        require(arg1 - (address(arg1)));
        require(arg2 - arg2);
        require(!arg2, "DelegateCollection: not trustedForwarder");
        require(!(msg.sender == (address(store_a))), "DelegateCollection: not trustedForwarder");
        address var_b = tx.origin;
        (bool success, bytes memory ret0) = address(store_a).Unresolved_6ba42aaa(var_b); // staticcall
        require(!0);
        require(0x3274b668aed85479e2a8511e74d7db7240ebe7c8 - msg.sender);
        var_b = address(msg.data[msg.data.length + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffec] >> 0x60);
        (bool success, bytes memory ret0) = address(unresolved_7f5ddd4c).Unresolved_3d76750c(var_b); // staticcall
        require(!0);
        (bool success, bytes memory ret0) = address(store_a).Unresolved_4c1e69fd(var_b); // staticcall
        require(!address(positionRouter).code.length);
        var_b = 0;
        uint256 var_c = 0;
        (bool success, bytes memory ret0) = address(positionRouter).{ value: var_c ether }Unresolved_0e39a812(var_b); // call
        require(!0);
        (bool success, bytes memory ret0) = address(store_a).Unresolved_2a71d166(var_b); // staticcall
        require(!(address(arg1) == 0), "DelegateCollection: DELEGATE_NOT_APPROVED");
        unresolved_24167157 = (uint248(unresolved_24167157)) | 0x010000000000000000000000000000000000000000;
        unresolved_191140d7 = 0;
        require(!address(unresolved_24167157).code.length);
        var_b = arg0;
        (bool success, bytes memory ret0) = address(unresolved_24167157).{ value: unresolved_191140d7 ether }Unresolved_2989c28a(var_b); // call
        unresolved_24167157 = uint248(unresolved_24167157);
        unresolved_191140d7 = 0;
        return ;
        require(var_f > 0xffffffffffffffff);
        var_f = var_f;
        require(0);
        unresolved_24167157 = uint248(unresolved_24167157);
        unresolved_191140d7 = 0;
        return ;
        require(0x20 > ret0.length);
        require(((var_f + 0x20) > 0xffffffffffffffff) | ((var_f + 0x20) < var_f));
        uint256 var_f = var_f + 0x20;
        require(((var_f + 0x20) - var_f) < 0x20);
        require(!(address(arg1) == 0), "DelegateCollection: DELEGATE_NOT_APPROVED");
        require(var_f > 0xffffffffffffffff);
        require(0x20 > ret0.length);
        require(((var_f + 0x20) > 0xffffffffffffffff) | ((var_f + 0x20) < var_f));
        var_f = var_f + 0x20;
        require(((var_f + 0x20) - var_f) < 0x20);
        require(!address(positionRouter).code.length);
        var_c = 0;
        (bool success, bytes memory ret0) = address(positionRouter).{ value: unresolved_191140d7 ether }Unresolved_0e39a812(var_c); // call
        (bool success, bytes memory ret0) = address(store_a).Unresolved_4c1e69fd(var_b); // staticcall
        if (0x20 > ret0.length) {
        }
        if (0x20 > ret0.length) {
        }
        var_b = address(msg.sender);
        (bool success, bytes memory ret0) = address(unresolved_7f5ddd4c).originAccount(var_b); // staticcall
        require(!0);
        (bool success, bytes memory ret0) = address(store_a).Unresolved_4c1e69fd(var_b); // staticcall
        if (0x20 > ret0.length) {
        }
        if (0x20 > ret0.length) {
        }
        if (0x20 > ret0.length) {
        }
    }
    
    /// @custom:selector    0x66db541e
    /// @custom:signature   Unresolved_66db541e(uint256 arg0, uint256 arg1, uint256 arg2, uint256 arg3, uint256 arg4, uint256 arg5, uint256 arg6, uint256 arg7, address arg8, uint256 arg9, uint256 arg10, uint256 arg11) public payable returns (uint256)
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    /// @param              arg1 ["uint256", "bytes32", "int256"]
    /// @param              arg2 ["uint256", "bytes32", "int256"]
    /// @param              arg3 ["uint256", "bytes32", "int256"]
    /// @param              arg4 ["uint256", "bytes32", "int256"]
    /// @param              arg6 ["uint256", "bytes32", "int256"]
    /// @param              arg7 ["uint256", "bytes32", "int256"]
    /// @param              arg8 ["uint256", "bytes32", "int256"]
    /// @param              arg9 ["address", "uint160", "bytes20", "int160"]
    /// @param              arg10 ["uint256", "bytes32", "int256"]
    /// @param              arg11 ["uint256", "bytes32", "int256"]
    /// @param              arg18446744073709551615 ["uint256", "bytes32", "int256"]
    function Unresolved_66db541e(uint256 arg0, uint256 arg1, uint256 arg2, uint256 arg3, uint256 arg4, uint256 arg5, uint256 arg6, uint256 arg7, address arg8, uint256 arg9, uint256 arg10, uint256 arg11) public payable returns (uint256) {
        require(msg.value);
        require((msg.data.length + 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc) < 0x0180);
        require(arg3 - arg3);
        require(arg9 - (address(arg9)));
        require(arg10 - arg10);
        require(arg11 > 0xffffffffffffffff);
        require(arg11 > 0xffffffffffffffff, "DelegateCollection: not trustedForwarder");
        require(((var_c + (uint248(((arg11 + 0x1f) + 0x20) + 0x1f))) > 0xffffffffffffffff) | ((var_c + (uint248(((arg11 + 0x1f) + 0x20) + 0x1f))) < var_c), "DelegateCollection: not trustedForwarder");
        uint256 var_c = var_c + (uint248(((arg11 + 0x1f) + 0x20) + 0x1f));
        require(!arg10, "DelegateCollection: not trustedForwarder");
        require(!(msg.sender == (address(store_a))), "DelegateCollection: not trustedForwarder");
        address var_g = tx.origin;
        (bool success, bytes memory ret0) = address(store_a).Unresolved_6ba42aaa(var_g); // staticcall
        require(!0);
        require(0x3274b668aed85479e2a8511e74d7db7240ebe7c8 - msg.sender);
        var_g = address(msg.data[msg.data.length + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffec] >> 0x60);
        (bool success, bytes memory ret0) = address(unresolved_7f5ddd4c).Unresolved_3d76750c(var_g); // staticcall
        require(!0);
        (bool success, bytes memory ret0) = address(store_a).Unresolved_4c1e69fd(var_g); // staticcall
        require(!address(positionRouter).code.length);
        var_g = 0;
        uint256 var_h = 0;
        (bool success, bytes memory ret0) = address(positionRouter).{ value: var_h ether }Unresolved_0e39a812(var_g); // call
        (bool success, bytes memory ret0) = address(store_a).Unresolved_2a71d166(var_g); // staticcall
        require(!(0 == (address(arg9))), "DelegateCollection: DELEGATE_NOT_APPROVED");
        unresolved_24167157 = (uint248(unresolved_24167157)) | 0x010000000000000000000000000000000000000000;
        unresolved_191140d7 = 0;
        require(!address(positionRouter).code.length);
        var_g = arg0;
        uint256 var_r = 0;
        (bool success, bytes memory ret0) = address(positionRouter).{ value: var_r ether }Unresolved_5bb1d7bd(var_g); // call
        (bool success, bytes memory ret0) = address(unresolved_24167157).minExecutionFee(); // staticcall
        require(arg7);
        (bool success, bytes memory ret0) = address(store_a).Unresolved_4c1e69fd(var_g); // staticcall
        require(!address(positionRouter).code.length);
        var_g = address(arg9);
        (bool success, bytes memory ret0) = address(positionRouter).{ value: var_r ether }Unresolved_0e39a812(var_g); // call
        require(((arg1 * arg2) % 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) - (arg1 * arg2) == (((arg1 * arg2) % 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) < (arg1 * arg2)));
        require(!0x05f5e100 > (((arg1 * arg2) % 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) - (arg1 * arg2) - (((arg1 * arg2) % 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) < (arg1 * arg2))));
        require((arg1 * arg2) % 0x05f5e100);
        require((((arg1 * arg2) - ((arg1 * arg2) % 0x05f5e100) >> 0x08) | (((arg1 * arg2) % 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) - (arg1 * arg2) - (((arg1 * arg2) % 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) < (arg1 * arg2)) - (((arg1 * arg2) % 0x05f5e100) > (arg1 * arg2)) << 0xf8) * 0xacbe0e98f503f8881186e60dbb7f727bf36b7213ee9f5a78c767074b22e90e21) > ((((arg1 * arg2) - ((arg1 * arg2) % 0x05f5e100) >> 0x08) | (((arg1 * arg2) % 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) - (arg1 * arg2) - (((arg1 * arg2) % 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) < (arg1 * arg2)) - (((arg1 * arg2) % 0x05f5e100) > (arg1 * arg2)) << 0xf8) * 0xacbe0e98f503f8881186e60dbb7f727bf36b7213ee9f5a78c767074b22e90e21) + 0x01));
        require(!address(unresolved_24167157).code.length);
        require(!address(unresolved_24167157).code.length);
        require((arg1 * arg2) % 0x05f5e100);
        require(!address(unresolved_24167157).code.length);
        require(var_c > 0xffffffffffffffff);
        var_c = var_c;
        require(0);
        if (0x20 > ret0.length) {
        }
        require(arg8);
        (bool success, bytes memory ret0) = address(store_a).Unresolved_4c1e69fd(var_g); // staticcall
        require(!address(positionRouter).code.length);
        var_g = address(arg9);
        (bool success, bytes memory ret0) = address(positionRouter).{ value: var_r ether }Unresolved_0e39a812(var_g); // call
        require(((arg1 * arg2) % 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) - (arg1 * arg2) == (((arg1 * arg2) % 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) < (arg1 * arg2)));
        require(!0x05f5e100 > (((arg1 * arg2) % 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) - (arg1 * arg2) - (((arg1 * arg2) % 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff) < (arg1 * arg2))));
        require((arg1 * arg2) % 0x05f5e100);
        require(!address(unresolved_24167157).code.length);
        require((arg1 * arg2) % 0x05f5e100);
        require(!address(unresolved_24167157).code.length);
        require(var_c > 0xffffffffffffffff);
        var_c = var_c;
        require(0);
        if (0x20 > ret0.length) {
        }
        unresolved_24167157 = uint248(unresolved_24167157);
        unresolved_191140d7 = 0;
        return ;
        if (0x20 > ret0.length) {
        }
        require(var_c > 0xffffffffffffffff);
        var_c = var_c;
        require(0);
        require(0x20 > ret0.length);
        require(((var_c + 0x20) > 0xffffffffffffffff) | ((var_c + 0x20) < var_c));
        var_c = var_c + 0x20;
        require(((var_c + 0x20) - var_c) < 0x20);
        require(!(0 == (address(arg9))), "DelegateCollection: DELEGATE_NOT_APPROVED");
        unresolved_24167157 = (uint248(unresolved_24167157)) | 0x010000000000000000000000000000000000000000;
        unresolved_191140d7 = var_c.length;
        require(!address(positionRouter).code.length);
        require(var_c > 0xffffffffffffffff);
        require(0x20 > ret0.length);
        require(((var_c + 0x20) > 0xffffffffffffffff) | ((var_c + 0x20) < var_c));
        var_c = var_c + 0x20;
        require(((var_c + 0x20) - var_c) < 0x20);
        require(!address(positionRouter).code.length);
        var_h = 0;
        (bool success, bytes memory ret0) = address(positionRouter).{ value: var_r ether }Unresolved_0e39a812(var_h); // call
        (bool success, bytes memory ret0) = address(store_a).Unresolved_2a71d166(var_h); // staticcall
        if (0x20 > ret0.length) {
        }
        (bool success, bytes memory ret0) = address(store_a).Unresolved_4c1e69fd(var_g); // staticcall
        if (0x20 > ret0.length) {
        }
        if (0x20 > ret0.length) {
        }
        var_g = address(msg.sender);
        (bool success, bytes memory ret0) = address(unresolved_7f5ddd4c).originAccount(var_g); // staticcall
        require(!0);
        (bool success, bytes memory ret0) = address(store_a).Unresolved_4c1e69fd(var_g); // staticcall
        if (0x20 > ret0.length) {
        }
        if (0x20 > ret0.length) {
        }
        if (0x20 > ret0.length) {
        }
    }
    
    /// @custom:selector    0x1d112718
    /// @custom:signature   Unresolved_1d112718(uint256 arg0, uint256 arg1, uint256 arg2, uint256 arg3, uint256 arg4, address arg5, uint256 arg6, uint256 arg7, uint256 arg8) public payable returns (uint256)
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    /// @param              arg1 ["uint256", "bytes32", "int256"]
    /// @param              arg2 ["uint256", "bytes32", "int256"]
    /// @param              arg3 ["uint256", "bytes32", "int256"]
    /// @param              arg4 ["uint256", "bytes32", "int256"]
    /// @param              arg6 ["address", "uint160", "bytes20", "int160"]
    /// @param              arg7 ["uint256", "bytes32", "int256"]
    /// @param              arg8 ["uint256", "bytes32", "int256"]
    /// @param              arg18446744073709551615 ["uint256", "bytes32", "int256"]
    function Unresolved_1d112718(uint256 arg0, uint256 arg1, uint256 arg2, uint256 arg3, uint256 arg4, address arg5, uint256 arg6, uint256 arg7, uint256 arg8) public payable returns (uint256) {
        require(msg.value);
        require((msg.data.length + 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc) < 0x0120);
        require(arg2 - arg2);
        require(arg4 - arg4);
        require(arg6 - (address(arg6)));
        require(arg7 - arg7);
        require(arg8 > 0xffffffffffffffff);
        require(arg8 > 0xffffffffffffffff, "DelegateCollection: not trustedForwarder");
        require(((var_c + (uint248(((arg8 + 0x1f) + 0x20) + 0x1f))) > 0xffffffffffffffff) | ((var_c + (uint248(((arg8 + 0x1f) + 0x20) + 0x1f))) < var_c), "DelegateCollection: not trustedForwarder");
        uint256 var_c = var_c + (uint248(((arg8 + 0x1f) + 0x20) + 0x1f));
        require(!arg7, "DelegateCollection: not trustedForwarder");
        require(!(msg.sender == (address(store_a))), "DelegateCollection: not trustedForwarder");
        address var_g = tx.origin;
        (bool success, bytes memory ret0) = address(store_a).Unresolved_6ba42aaa(var_g); // staticcall
        require(!0);
        require(0x3274b668aed85479e2a8511e74d7db7240ebe7c8 - msg.sender);
        var_g = address(msg.data[msg.data.length + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffec] >> 0x60);
        (bool success, bytes memory ret0) = address(unresolved_7f5ddd4c).Unresolved_3d76750c(var_g); // staticcall
        require(!0);
        (bool success, bytes memory ret0) = address(store_a).Unresolved_4c1e69fd(var_g); // staticcall
        require(!address(positionRouter).code.length);
        var_g = 0;
        uint256 var_h = 0;
        (bool success, bytes memory ret0) = address(positionRouter).{ value: var_h ether }Unresolved_0e39a812(var_g); // call
        (bool success, bytes memory ret0) = address(store_a).Unresolved_2a71d166(var_g); // staticcall
        require(!(address(arg6) == 0), "DelegateCollection: DELEGATE_NOT_APPROVED");
        unresolved_24167157 = (uint248(unresolved_24167157)) | 0x010000000000000000000000000000000000000000;
        unresolved_191140d7 = 0;
        require(!address(unresolved_24167157).code.length);
        var_g = arg0;
        uint256 var_l = 0;
        (bool success, bytes memory ret0) = address(unresolved_24167157).{ value: unresolved_191140d7 ether }Unresolved_1d112718(var_g); // call
        unresolved_24167157 = uint248(unresolved_24167157);
        unresolved_191140d7 = 0;
        return ;
        require(var_c > 0xffffffffffffffff);
        var_c = var_c;
        unresolved_24167157 = uint248(unresolved_24167157);
        unresolved_191140d7 = 0;
        return ;
        require(0x20 > ret0.length);
        require(((var_c + 0x20) > 0xffffffffffffffff) | ((var_c + 0x20) < var_c));
        var_c = var_c + 0x20;
        require(((var_c + 0x20) - var_c) < 0x20);
        require(!(address(arg6) == 0), "DelegateCollection: DELEGATE_NOT_APPROVED");
        unresolved_24167157 = (uint248(unresolved_24167157)) | 0x010000000000000000000000000000000000000000;
        unresolved_191140d7 = var_c.length;
        require(!address(unresolved_24167157).code.length);
        require(var_c > 0xffffffffffffffff);
        require(0x20 > ret0.length);
        require(((var_c + 0x20) > 0xffffffffffffffff) | ((var_c + 0x20) < var_c));
        var_c = var_c + 0x20;
        require(((var_c + 0x20) - var_c) < 0x20);
        require(!address(positionRouter).code.length);
        var_h = 0;
        (bool success, bytes memory ret0) = address(positionRouter).{ value: var_l ether }Unresolved_0e39a812(var_h); // call
        (bool success, bytes memory ret0) = address(store_a).Unresolved_2a71d166(var_h); // staticcall
        if (0x20 > ret0.length) {
        }
        (bool success, bytes memory ret0) = address(store_a).Unresolved_4c1e69fd(var_g); // staticcall
        if (0x20 > ret0.length) {
        }
        if (0x20 > ret0.length) {
        }
        var_g = address(msg.sender);
        (bool success, bytes memory ret0) = address(unresolved_7f5ddd4c).originAccount(var_g); // staticcall
        require(!0);
        (bool success, bytes memory ret0) = address(store_a).Unresolved_4c1e69fd(var_g); // staticcall
        if (0x20 > ret0.length) {
        }
        if (0x20 > ret0.length) {
        }
        if (0x20 > ret0.length) {
        }
    }
    
    /// @custom:selector    0x3539179e
    /// @custom:signature   Unresolved_3539179e(uint256 arg0, uint256 arg1, uint256 arg2, uint256 arg3, address arg4, uint256 arg5, uint256 arg6, uint256 arg7) public payable returns (uint256)
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    /// @param              arg1 ["uint256", "bytes32", "int256"]
    /// @param              arg2 ["uint256", "bytes32", "int256"]
    /// @param              arg3 ["uint256", "bytes32", "int256"]
    /// @param              arg5 ["address", "uint160", "bytes20", "int160"]
    /// @param              arg6 ["uint256", "bytes32", "int256"]
    /// @param              arg7 ["uint256", "bytes32", "int256"]
    /// @param              arg18446744073709551615 ["uint256", "bytes32", "int256"]
    function Unresolved_3539179e(uint256 arg0, uint256 arg1, uint256 arg2, uint256 arg3, address arg4, uint256 arg5, uint256 arg6, uint256 arg7) public payable returns (uint256) {
        require(msg.value);
        require((msg.data.length + 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc) < 0x0100);
        require(arg2 - arg2);
        require(arg5 - (address(arg5)));
        require(arg6 - arg6);
        require(arg7 > 0xffffffffffffffff);
        require(arg7 > 0xffffffffffffffff, "DelegateCollection: not trustedForwarder");
        require(((var_c + (uint248(((arg7 + 0x1f) + 0x20) + 0x1f))) > 0xffffffffffffffff) | ((var_c + (uint248(((arg7 + 0x1f) + 0x20) + 0x1f))) < var_c), "DelegateCollection: not trustedForwarder");
        uint256 var_c = var_c + (uint248(((arg7 + 0x1f) + 0x20) + 0x1f));
        require(!arg6, "DelegateCollection: not trustedForwarder");
        require(!(msg.sender == (address(store_a))), "DelegateCollection: not trustedForwarder");
        address var_g = tx.origin;
        (bool success, bytes memory ret0) = address(store_a).Unresolved_6ba42aaa(var_g); // staticcall
        require(!0);
        require(0x3274b668aed85479e2a8511e74d7db7240ebe7c8 - msg.sender);
        var_g = address(msg.data[msg.data.length + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffec] >> 0x60);
        (bool success, bytes memory ret0) = address(unresolved_7f5ddd4c).Unresolved_3d76750c(var_g); // staticcall
        require(!0);
        (bool success, bytes memory ret0) = address(store_a).Unresolved_4c1e69fd(var_g); // staticcall
        require(!address(positionRouter).code.length);
        var_g = 0;
        uint256 var_h = 0;
        (bool success, bytes memory ret0) = address(positionRouter).{ value: var_h ether }Unresolved_0e39a812(var_g); // call
        (bool success, bytes memory ret0) = address(store_a).Unresolved_2a71d166(var_g); // staticcall
        require(!(0 == (address(arg5))), "DelegateCollection: DELEGATE_NOT_APPROVED");
        unresolved_24167157 = (uint248(unresolved_24167157)) | 0x010000000000000000000000000000000000000000;
        unresolved_191140d7 = 0;
        require(!address(positionRouter).code.length);
        var_g = arg0;
        uint256 var_k = 0;
        uint256 var_p = 0;
        (bool success, bytes memory ret0) = address(positionRouter).{ value: var_k ether }Unresolved_3539179e(var_g); // call
        unresolved_24167157 = uint248(unresolved_24167157);
        unresolved_191140d7 = 0;
        return ;
        require(var_c > 0xffffffffffffffff);
        var_c = var_c;
        require(0);
        unresolved_24167157 = uint248(unresolved_24167157);
        unresolved_191140d7 = 0;
        return ;
        require(0x20 > ret0.length);
        require(((var_c + 0x20) > 0xffffffffffffffff) | ((var_c + 0x20) < var_c));
        var_c = var_c + 0x20;
        require(((var_c + 0x20) - var_c) < 0x20);
        require(!(0 == (address(arg5))), "DelegateCollection: DELEGATE_NOT_APPROVED");
        unresolved_24167157 = (uint248(unresolved_24167157)) | 0x010000000000000000000000000000000000000000;
        unresolved_191140d7 = var_c.length;
        require(!address(positionRouter).code.length);
        require(var_c > 0xffffffffffffffff);
        require(0x20 > ret0.length);
        require(((var_c + 0x20) > 0xffffffffffffffff) | ((var_c + 0x20) < var_c));
        var_c = var_c + 0x20;
        require(((var_c + 0x20) - var_c) < 0x20);
        require(!address(positionRouter).code.length);
        var_h = 0;
        (bool success, bytes memory ret0) = address(positionRouter).{ value: var_p ether }Unresolved_0e39a812(var_h); // call
        (bool success, bytes memory ret0) = address(store_a).Unresolved_2a71d166(var_h); // staticcall
        if (0x20 > ret0.length) {
        }
        (bool success, bytes memory ret0) = address(store_a).Unresolved_4c1e69fd(var_g); // staticcall
        if (0x20 > ret0.length) {
        }
        if (0x20 > ret0.length) {
        }
        var_g = address(msg.sender);
        (bool success, bytes memory ret0) = address(unresolved_7f5ddd4c).originAccount(var_g); // staticcall
        require(!0);
        (bool success, bytes memory ret0) = address(store_a).Unresolved_4c1e69fd(var_g); // staticcall
        if (0x20 > ret0.length) {
        }
        if (0x20 > ret0.length) {
        }
        if (0x20 > ret0.length) {
        }
    }
    
    /// @custom:selector    0x65cd4fc9
    /// @custom:signature   Unresolved_65cd4fc9(uint256 arg0, uint256 arg1, uint256 arg2, uint256 arg3, address arg4, uint256 arg5, uint256 arg6) public payable returns (uint256)
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    /// @param              arg1 ["uint256", "bytes32", "int256"]
    /// @param              arg2 ["uint256", "bytes32", "int256"]
    /// @param              arg3 ["uint256", "bytes32", "int256"]
    /// @param              arg4 ["address", "uint160", "bytes20", "int160"]
    /// @param              arg5 ["uint256", "bytes32", "int256"]
    /// @param              arg18446744073709551615 ["uint256", "bytes32", "int256"]
    function Unresolved_65cd4fc9(uint256 arg0, uint256 arg1, uint256 arg2, uint256 arg3, address arg4, uint256 arg5, uint256 arg6) public payable returns (uint256) {
        require(msg.value);
        require((msg.data.length + 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc) < 0xc0);
        require(arg3 - arg3);
        require(arg4 - (address(arg4)));
        require(arg5 - arg5);
        require(!arg5, "DelegateCollection: not trustedForwarder");
        require(!(msg.sender == (address(store_a))), "DelegateCollection: not trustedForwarder");
        address var_b = tx.origin;
        (bool success, bytes memory ret0) = address(store_a).Unresolved_6ba42aaa(var_b); // staticcall
        require(!0);
        require(0x3274b668aed85479e2a8511e74d7db7240ebe7c8 - msg.sender);
        var_b = address(msg.data[msg.data.length + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffec] >> 0x60);
        (bool success, bytes memory ret0) = address(unresolved_7f5ddd4c).Unresolved_3d76750c(var_b); // staticcall
        require(!0);
        (bool success, bytes memory ret0) = address(store_a).Unresolved_4c1e69fd(var_b); // staticcall
        require(!address(positionRouter).code.length);
        var_b = 0;
        uint256 var_c = 0;
        (bool success, bytes memory ret0) = address(positionRouter).{ value: var_c ether }Unresolved_0e39a812(var_b); // call
        require(!0);
        (bool success, bytes memory ret0) = address(store_a).Unresolved_2a71d166(var_b); // staticcall
        require(!(address(arg4) == 0), "DelegateCollection: DELEGATE_NOT_APPROVED");
        unresolved_24167157 = (uint248(unresolved_24167157)) | 0x010000000000000000000000000000000000000000;
        unresolved_191140d7 = 0;
        require(!address(unresolved_24167157).code.length);
        var_b = arg0;
        (bool success, bytes memory ret0) = address(unresolved_24167157).{ value: unresolved_191140d7 ether }Unresolved_65cd4fc9(var_b); // call
        unresolved_24167157 = uint248(unresolved_24167157);
        unresolved_191140d7 = 0;
        return ;
        require(var_h > 0xffffffffffffffff);
        var_h = var_h;
        require(0);
        unresolved_24167157 = uint248(unresolved_24167157);
        unresolved_191140d7 = 0;
        return ;
        require(0x20 > ret0.length);
        require(((var_h + 0x20) > 0xffffffffffffffff) | ((var_h + 0x20) < var_h));
        uint256 var_h = var_h + 0x20;
        require(((var_h + 0x20) - var_h) < 0x20);
        require(!(address(arg4) == 0), "DelegateCollection: DELEGATE_NOT_APPROVED");
        require(var_h > 0xffffffffffffffff);
        require(0x20 > ret0.length);
        require(((var_h + 0x20) > 0xffffffffffffffff) | ((var_h + 0x20) < var_h));
        var_h = var_h + 0x20;
        require(((var_h + 0x20) - var_h) < 0x20);
        require(!address(positionRouter).code.length);
        var_c = 0;
        (bool success, bytes memory ret0) = address(positionRouter).{ value: unresolved_191140d7 ether }Unresolved_0e39a812(var_c); // call
        (bool success, bytes memory ret0) = address(store_a).Unresolved_4c1e69fd(var_b); // staticcall
        if (0x20 > ret0.length) {
        }
        if (0x20 > ret0.length) {
        }
        var_b = address(msg.sender);
        (bool success, bytes memory ret0) = address(unresolved_7f5ddd4c).originAccount(var_b); // staticcall
        require(!0);
        (bool success, bytes memory ret0) = address(store_a).Unresolved_4c1e69fd(var_b); // staticcall
        if (0x20 > ret0.length) {
        }
        if (0x20 > ret0.length) {
        }
        if (0x20 > ret0.length) {
        }
    }
    
    /// @custom:selector    0x572b6c05
    /// @custom:signature   isTrustedForwarder(address arg0) public pure returns (address)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function isTrustedForwarder(address arg0) public pure returns (address) {
        require(msg.value);
        require((msg.data.length + 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc) < 0x20);
        require(arg0 - (address(arg0)));
        return (address(arg0)) == 0x3274b668aed85479e2a8511e74d7db7240ebe7c8;
    }
    
    /// @custom:selector    0x4f0840be
    /// @custom:signature   Unresolved_4f0840be(uint256 arg0, uint256 arg1, uint256 arg2, uint256 arg3, uint256 arg4, uint256 arg5, address arg6) public payable
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    /// @param              arg1 ["uint256", "bytes32", "int256"]
    /// @param              arg2 ["uint256", "bytes32", "int256"]
    /// @param              arg3 ["uint256", "bytes32", "int256"]
    /// @param              arg4 ["uint256", "bytes32", "int256"]
    /// @param              arg5 ["uint256", "bytes32", "int256"]
    /// @param              arg6 ["address", "uint160", "bytes20", "int160"]
    function Unresolved_4f0840be(uint256 arg0, uint256 arg1, uint256 arg2, uint256 arg3, uint256 arg4, uint256 arg5, address arg6) public payable {
        require((msg.data.length + 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc) < 0xe0);
        require(arg0 > 0xffffffffffffffff);
        require(arg0 > 0xffffffffffffffff);
        require(arg1 > 0xffffffffffffffff);
        require(arg1 > 0xffffffffffffffff);
        require(arg2 > 0xffffffffffffffff);
        require(arg2 > 0xffffffffffffffff);
        require(arg3 > 0xffffffffffffffff);
        require(arg3 > 0xffffffffffffffff);
        require(arg4 > 0xffffffffffffffff);
        require(arg4 > 0xffffffffffffffff);
        require(arg5 > 0xffffffffffffffff);
        require(!(arg5 + 0x23) < msg.data.length);
        require(arg5 > 0xffffffffffffffff);
        require(((var_c + (uint248((0x20 + (arg5 << 0x05)) + 0x1f))) > 0xffffffffffffffff) | ((var_c + (uint248((0x20 + (arg5 << 0x05)) + 0x1f))) < var_c));
        uint256 var_c = var_c + (uint248((0x20 + (arg5 << 0x05)) + 0x1f));
        require(((arg5 + (arg5 << 0x05)) + 0x24) > msg.data.length);
        require((arg5 + 0x24) < ((arg5 + (arg5 << 0x05)) + 0x24));
        require(msg.data[arg5 + 0x24] > 0xffffffffffffffff);
        require(((msg.data.length - (arg5 + (msg.data[arg5 + 0x24]))) + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdc) < 0x60);
        require(((var_c + 0x60) > 0xffffffffffffffff) | ((var_c + 0x60) < var_c));
        require(msg.data[(arg5 + (msg.data[arg5 + 0x24])) + 0x24] - (address(msg.data[(arg5 + (msg.data[arg5 + 0x24])) + 0x24])));
        require(msg.data[0x64 + (msg.data[arg5 + 0x24] + arg5)] > 0xffffffffffffffff);
        if (!((arg5 + (msg.data[arg5 + 0x24])) + (msg.data[0x64 + (msg.data[arg5 + 0x24] + arg5)]) + 0x43) < msg.data.length) {
            require(!((arg5 + (msg.data[arg5 + 0x24])) + (msg.data[0x64 + (msg.data[arg5 + 0x24] + arg5)]) + 0x43) < msg.data.length);
            require(msg.data[((arg5 + (msg.data[arg5 + 0x24])) + (msg.data[0x64 + (msg.data[arg5 + 0x24] + arg5)])) + 0x24] > 0xffffffffffffffff);
            var_c = var_c + (uint248((0x20 + (msg.data[((arg5 + (msg.data[arg5 + 0x24])) + (msg.data[0x64 + (msg.data[arg5 + 0x24] + arg5)])) + 0x24] << 0x05)) + 0x1f));
            require(((var_c + (uint248((0x20 + (msg.data[((arg5 + (msg.data[arg5 + 0x24])) + (msg.data[0x64 + (msg.data[arg5 + 0x24] + arg5)])) + 0x24] << 0x05)) + 0x1f))) > 0xffffffffffffffff) | ((var_c + (uint248((0x20 + (msg.data[((arg5 + (msg.data[arg5 + 0x24])) + (msg.data[0x64 + (msg.data[arg5 + 0x24] + arg5)])) + 0x24] << 0x05)) + 0x1f))) < var_c));
            require(((arg5 + (msg.data[arg5 + 0x24])) + (msg.data[0x64 + (msg.data[arg5 + 0x24] + arg5)]) + (msg.data[((arg5 + (msg.data[arg5 + 0x24])) + (msg.data[0x64 + (msg.data[arg5 + 0x24] + arg5)])) + 0x24] << 0x05) + 0x44) > msg.data.length);
        }
        require(arg6 - (address(arg6)));
        require(!(msg.sender == (address(store_a))), "DelegateCollection: not trustedForwarder");
        address var_h = tx.origin;
        (bool success, bytes memory ret0) = address(store_a).isKeeper(var_h); // staticcall
        require(!0, "DelegateCollection: not keeper");
        if (0x20 > ret0.length) {
        }
    }
    
    /// @custom:selector    0xa98440c5
    /// @custom:signature   Unresolved_a98440c5(uint256 arg0, uint256 arg1, uint256 arg2, uint256 arg3, address arg4, uint256 arg5, uint256 arg6) public payable returns (uint256)
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    /// @param              arg1 ["uint256", "bytes32", "int256"]
    /// @param              arg2 ["uint256", "bytes32", "int256"]
    /// @param              arg3 ["uint256", "bytes32", "int256"]
    /// @param              arg4 ["address", "uint160", "bytes20", "int160"]
    /// @param              arg5 ["uint256", "bytes32", "int256"]
    /// @param              arg18446744073709551615 ["uint256", "bytes32", "int256"]
    function Unresolved_a98440c5(uint256 arg0, uint256 arg1, uint256 arg2, uint256 arg3, address arg4, uint256 arg5, uint256 arg6) public payable returns (uint256) {
        require(msg.value);
        require((msg.data.length + 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc) < 0xc0);
        require(arg3 - arg3);
        require(arg4 - (address(arg4)));
        require(arg5 - arg5);
        require(!arg5, "DelegateCollection: not trustedForwarder");
        require(!(msg.sender == (address(store_a))), "DelegateCollection: not trustedForwarder");
        address var_b = tx.origin;
        (bool success, bytes memory ret0) = address(store_a).Unresolved_6ba42aaa(var_b); // staticcall
        require(!0);
        require(0x3274b668aed85479e2a8511e74d7db7240ebe7c8 - msg.sender);
        var_b = address(msg.data[msg.data.length + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffec] >> 0x60);
        (bool success, bytes memory ret0) = address(unresolved_7f5ddd4c).Unresolved_3d76750c(var_b); // staticcall
        require(!0);
        (bool success, bytes memory ret0) = address(store_a).Unresolved_4c1e69fd(var_b); // staticcall
        require(!address(positionRouter).code.length);
        var_b = 0;
        uint256 var_c = 0;
        (bool success, bytes memory ret0) = address(positionRouter).{ value: var_c ether }Unresolved_0e39a812(var_b); // call
        require(!0);
        (bool success, bytes memory ret0) = address(store_a).Unresolved_2a71d166(var_b); // staticcall
        require(!(address(arg4) == 0), "DelegateCollection: DELEGATE_NOT_APPROVED");
        unresolved_24167157 = (uint248(unresolved_24167157)) | 0x010000000000000000000000000000000000000000;
        unresolved_191140d7 = 0;
        require(!address(unresolved_24167157).code.length);
        var_b = arg0;
        (bool success, bytes memory ret0) = address(unresolved_24167157).{ value: unresolved_191140d7 ether }Unresolved_a98440c5(var_b); // call
        unresolved_24167157 = uint248(unresolved_24167157);
        unresolved_191140d7 = 0;
        return ;
        require(var_h > 0xffffffffffffffff);
        var_h = var_h;
        require(0);
        unresolved_24167157 = uint248(unresolved_24167157);
        unresolved_191140d7 = 0;
        return ;
        require(0x20 > ret0.length);
        require(((var_h + 0x20) > 0xffffffffffffffff) | ((var_h + 0x20) < var_h));
        uint256 var_h = var_h + 0x20;
        require(((var_h + 0x20) - var_h) < 0x20);
        require(!(address(arg4) == 0), "DelegateCollection: DELEGATE_NOT_APPROVED");
        require(var_h > 0xffffffffffffffff);
        require(0x20 > ret0.length);
        require(((var_h + 0x20) > 0xffffffffffffffff) | ((var_h + 0x20) < var_h));
        var_h = var_h + 0x20;
        require(((var_h + 0x20) - var_h) < 0x20);
        require(!address(positionRouter).code.length);
        var_c = 0;
        (bool success, bytes memory ret0) = address(positionRouter).{ value: unresolved_191140d7 ether }Unresolved_0e39a812(var_c); // call
        (bool success, bytes memory ret0) = address(store_a).Unresolved_4c1e69fd(var_b); // staticcall
        if (0x20 > ret0.length) {
        }
        if (0x20 > ret0.length) {
        }
        var_b = address(msg.sender);
        (bool success, bytes memory ret0) = address(unresolved_7f5ddd4c).originAccount(var_b); // staticcall
        require(!0);
        (bool success, bytes memory ret0) = address(store_a).Unresolved_4c1e69fd(var_b); // staticcall
        if (0x20 > ret0.length) {
        }
        if (0x20 > ret0.length) {
        }
        if (0x20 > ret0.length) {
        }
    }
    
    /// @custom:selector    0x5bb1d7bd
    /// @custom:signature   Unresolved_5bb1d7bd(uint256 arg0, uint256 arg1, uint256 arg2, uint256 arg3, uint256 arg4, uint256 arg5, address arg6, uint256 arg7, uint256 arg8, uint256 arg9) public payable returns (uint256)
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    /// @param              arg1 ["uint256", "bytes32", "int256"]
    /// @param              arg2 ["uint256", "bytes32", "int256"]
    /// @param              arg3 ["uint256", "bytes32", "int256"]
    /// @param              arg4 ["uint256", "bytes32", "int256"]
    /// @param              arg6 ["uint256", "bytes32", "int256"]
    /// @param              arg7 ["address", "uint160", "bytes20", "int160"]
    /// @param              arg8 ["uint256", "bytes32", "int256"]
    /// @param              arg9 ["uint256", "bytes32", "int256"]
    /// @param              arg18446744073709551615 ["uint256", "bytes32", "int256"]
    function Unresolved_5bb1d7bd(uint256 arg0, uint256 arg1, uint256 arg2, uint256 arg3, uint256 arg4, uint256 arg5, address arg6, uint256 arg7, uint256 arg8, uint256 arg9) public payable returns (uint256) {
        require(msg.value);
        require((msg.data.length + 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc) < 0x0140);
        require(arg3 - arg3);
        require(arg7 - (address(arg7)));
        require(arg8 - arg8);
        require(arg9 > 0xffffffffffffffff);
        require(arg9 > 0xffffffffffffffff, "DelegateCollection: not trustedForwarder");
        require(((var_c + (uint248(((arg9 + 0x1f) + 0x20) + 0x1f))) > 0xffffffffffffffff) | ((var_c + (uint248(((arg9 + 0x1f) + 0x20) + 0x1f))) < var_c), "DelegateCollection: not trustedForwarder");
        uint256 var_c = var_c + (uint248(((arg9 + 0x1f) + 0x20) + 0x1f));
        require(!arg8, "DelegateCollection: not trustedForwarder");
        require(!(msg.sender == (address(store_a))), "DelegateCollection: not trustedForwarder");
        address var_g = tx.origin;
        (bool success, bytes memory ret0) = address(store_a).Unresolved_6ba42aaa(var_g); // staticcall
        require(!0);
        require(0x3274b668aed85479e2a8511e74d7db7240ebe7c8 - msg.sender);
        var_g = address(msg.data[msg.data.length + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffec] >> 0x60);
        (bool success, bytes memory ret0) = address(unresolved_7f5ddd4c).Unresolved_3d76750c(var_g); // staticcall
        require(!0);
        (bool success, bytes memory ret0) = address(store_a).Unresolved_4c1e69fd(var_g); // staticcall
        require(!address(positionRouter).code.length);
        var_g = 0;
        uint256 var_h = 0;
        (bool success, bytes memory ret0) = address(positionRouter).{ value: var_h ether }Unresolved_0e39a812(var_g); // call
        (bool success, bytes memory ret0) = address(store_a).Unresolved_2a71d166(var_g); // staticcall
        require(!(0 == (address(arg7))), "DelegateCollection: DELEGATE_NOT_APPROVED");
        unresolved_24167157 = (uint248(unresolved_24167157)) | 0x010000000000000000000000000000000000000000;
        unresolved_191140d7 = 0;
        require(!address(positionRouter).code.length);
        var_g = arg0;
        uint256 var_r = 0;
        (bool success, bytes memory ret0) = address(positionRouter).{ value: var_r ether }Unresolved_5bb1d7bd(var_g); // call
        unresolved_24167157 = uint248(unresolved_24167157);
        unresolved_191140d7 = 0;
        return ;
        require(var_c > 0xffffffffffffffff);
        var_c = var_c;
        require(0);
        unresolved_24167157 = uint248(unresolved_24167157);
        unresolved_191140d7 = 0;
        return ;
        require(0x20 > ret0.length);
        require(((var_c + 0x20) > 0xffffffffffffffff) | ((var_c + 0x20) < var_c));
        var_c = var_c + 0x20;
        require(((var_c + 0x20) - var_c) < 0x20);
        require(!(0 == (address(arg7))), "DelegateCollection: DELEGATE_NOT_APPROVED");
        unresolved_24167157 = (uint248(unresolved_24167157)) | 0x010000000000000000000000000000000000000000;
        unresolved_191140d7 = var_c.length;
        require(!address(positionRouter).code.length);
        require(var_c > 0xffffffffffffffff);
        require(0x20 > ret0.length);
        require(((var_c + 0x20) > 0xffffffffffffffff) | ((var_c + 0x20) < var_c));
        var_c = var_c + 0x20;
        require(((var_c + 0x20) - var_c) < 0x20);
        require(!address(positionRouter).code.length);
        var_h = 0;
        (bool success, bytes memory ret0) = address(positionRouter).{ value: var_r ether }Unresolved_0e39a812(var_h); // call
        (bool success, bytes memory ret0) = address(store_a).Unresolved_2a71d166(var_h); // staticcall
        if (0x20 > ret0.length) {
        }
        (bool success, bytes memory ret0) = address(store_a).Unresolved_4c1e69fd(var_g); // staticcall
        if (0x20 > ret0.length) {
        }
        if (0x20 > ret0.length) {
        }
        var_g = address(msg.sender);
        (bool success, bytes memory ret0) = address(unresolved_7f5ddd4c).originAccount(var_g); // staticcall
        require(!0);
        (bool success, bytes memory ret0) = address(store_a).Unresolved_4c1e69fd(var_g); // staticcall
        if (0x20 > ret0.length) {
        }
        if (0x20 > ret0.length) {
        }
        if (0x20 > ret0.length) {
        }
    }
    
    /// @custom:selector    0x8fb30e12
    /// @custom:signature   Unresolved_8fb30e12(uint256 arg0, address arg1, uint256 arg2, uint256 arg3) public payable returns (uint256)
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    /// @param              arg1 ["address", "uint160", "bytes20", "int160"]
    /// @param              arg2 ["uint256", "bytes32", "int256"]
    /// @param              arg18446744073709551615 ["uint256", "bytes32", "int256"]
    function Unresolved_8fb30e12(uint256 arg0, address arg1, uint256 arg2, uint256 arg3) public payable returns (uint256) {
        require(msg.value);
        require((msg.data.length + 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc) < 0x60);
        require(arg1 - (address(arg1)));
        require(arg2 - arg2);
        require(!arg2, "DelegateCollection: not trustedForwarder");
        require(!(msg.sender == (address(store_a))), "DelegateCollection: not trustedForwarder");
        address var_b = tx.origin;
        (bool success, bytes memory ret0) = address(store_a).Unresolved_6ba42aaa(var_b); // staticcall
        require(!0);
        require(0x3274b668aed85479e2a8511e74d7db7240ebe7c8 - msg.sender);
        var_b = address(msg.data[msg.data.length + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffec] >> 0x60);
        (bool success, bytes memory ret0) = address(unresolved_7f5ddd4c).Unresolved_3d76750c(var_b); // staticcall
        require(!0);
        (bool success, bytes memory ret0) = address(store_a).Unresolved_4c1e69fd(var_b); // staticcall
        require(!address(positionRouter).code.length);
        var_b = 0;
        uint256 var_c = 0;
        (bool success, bytes memory ret0) = address(positionRouter).{ value: var_c ether }Unresolved_0e39a812(var_b); // call
        require(!0);
        (bool success, bytes memory ret0) = address(store_a).Unresolved_2a71d166(var_b); // staticcall
        require(!(address(arg1) == 0), "DelegateCollection: DELEGATE_NOT_APPROVED");
        unresolved_24167157 = (uint248(unresolved_24167157)) | 0x010000000000000000000000000000000000000000;
        unresolved_191140d7 = 0;
        require(!address(unresolved_24167157).code.length);
        var_b = arg0;
        (bool success, bytes memory ret0) = address(unresolved_24167157).{ value: unresolved_191140d7 ether }Unresolved_8fb30e12(var_b); // call
        unresolved_24167157 = uint248(unresolved_24167157);
        unresolved_191140d7 = 0;
        return ;
        require(var_f > 0xffffffffffffffff);
        var_f = var_f;
        require(0);
        unresolved_24167157 = uint248(unresolved_24167157);
        unresolved_191140d7 = 0;
        return ;
        require(0x20 > ret0.length);
        require(((var_f + 0x20) > 0xffffffffffffffff) | ((var_f + 0x20) < var_f));
        uint256 var_f = var_f + 0x20;
        require(((var_f + 0x20) - var_f) < 0x20);
        require(!(address(arg1) == 0), "DelegateCollection: DELEGATE_NOT_APPROVED");
        require(var_f > 0xffffffffffffffff);
        require(0x20 > ret0.length);
        require(((var_f + 0x20) > 0xffffffffffffffff) | ((var_f + 0x20) < var_f));
        var_f = var_f + 0x20;
        require(((var_f + 0x20) - var_f) < 0x20);
        require(!address(positionRouter).code.length);
        var_c = 0;
        (bool success, bytes memory ret0) = address(positionRouter).{ value: unresolved_191140d7 ether }Unresolved_0e39a812(var_c); // call
        (bool success, bytes memory ret0) = address(store_a).Unresolved_4c1e69fd(var_b); // staticcall
        if (0x20 > ret0.length) {
        }
        if (0x20 > ret0.length) {
        }
        var_b = address(msg.sender);
        (bool success, bytes memory ret0) = address(unresolved_7f5ddd4c).originAccount(var_b); // staticcall
        require(!0);
        (bool success, bytes memory ret0) = address(store_a).Unresolved_4c1e69fd(var_b); // staticcall
        if (0x20 > ret0.length) {
        }
        if (0x20 > ret0.length) {
        }
        if (0x20 > ret0.length) {
        }
    }
    
    /// @custom:selector    0x8d04bf0a
    /// @custom:signature   Unresolved_8d04bf0a(uint256 arg0, uint256 arg1, uint256 arg2, address arg3, uint256 arg4, uint256 arg5) public payable returns (uint256)
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    /// @param              arg1 ["uint256", "bytes32", "int256"]
    /// @param              arg2 ["uint256", "bytes32", "int256"]
    /// @param              arg3 ["address", "uint160", "bytes20", "int160"]
    /// @param              arg4 ["uint256", "bytes32", "int256"]
    /// @param              arg18446744073709551615 ["uint256", "bytes32", "int256"]
    function Unresolved_8d04bf0a(uint256 arg0, uint256 arg1, uint256 arg2, address arg3, uint256 arg4, uint256 arg5) public payable returns (uint256) {
        require(msg.value);
        require((msg.data.length + 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc) < 0xa0);
        require(arg1 - arg1);
        require(arg3 - (address(arg3)));
        require(arg4 - arg4);
        require(!arg4, "DelegateCollection: not trustedForwarder");
        require(!(msg.sender == (address(store_a))), "DelegateCollection: not trustedForwarder");
        address var_b = tx.origin;
        (bool success, bytes memory ret0) = address(store_a).Unresolved_6ba42aaa(var_b); // staticcall
        require(!0);
        require(0x3274b668aed85479e2a8511e74d7db7240ebe7c8 - msg.sender);
        var_b = address(msg.data[msg.data.length + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffec] >> 0x60);
        (bool success, bytes memory ret0) = address(unresolved_7f5ddd4c).Unresolved_3d76750c(var_b); // staticcall
        require(!0);
        (bool success, bytes memory ret0) = address(store_a).Unresolved_4c1e69fd(var_b); // staticcall
        require(!address(positionRouter).code.length);
        var_b = 0;
        uint256 var_c = 0;
        (bool success, bytes memory ret0) = address(positionRouter).{ value: var_c ether }Unresolved_0e39a812(var_b); // call
        require(!0);
        (bool success, bytes memory ret0) = address(store_a).Unresolved_2a71d166(var_b); // staticcall
        require(!(0 == (address(arg3))), "DelegateCollection: DELEGATE_NOT_APPROVED");
        unresolved_24167157 = (uint248(unresolved_24167157)) | 0x010000000000000000000000000000000000000000;
        unresolved_191140d7 = 0;
        require(!address(perpTrade).code.length);
        var_b = arg0;
        (bool success, bytes memory ret0) = address(perpTrade).{ value: unresolved_191140d7 ether }Unresolved_8d04bf0a(var_b); // call
        unresolved_24167157 = uint248(unresolved_24167157);
        unresolved_191140d7 = 0;
        return ;
        require(var_g > 0xffffffffffffffff);
        var_g = var_g;
        require(0);
        unresolved_24167157 = uint248(unresolved_24167157);
        unresolved_191140d7 = 0;
        return ;
        require(0x20 > ret0.length);
        require(((var_g + 0x20) > 0xffffffffffffffff) | ((var_g + 0x20) < var_g));
        uint256 var_g = var_g + 0x20;
        require(((var_g + 0x20) - var_g) < 0x20);
        require(!(0 == (address(arg3))), "DelegateCollection: DELEGATE_NOT_APPROVED");
        require(var_g > 0xffffffffffffffff);
        require(0x20 > ret0.length);
        require(((var_g + 0x20) > 0xffffffffffffffff) | ((var_g + 0x20) < var_g));
        var_g = var_g + 0x20;
        require(((var_g + 0x20) - var_g) < 0x20);
        require(!address(positionRouter).code.length);
        var_c = 0;
        (bool success, bytes memory ret0) = address(positionRouter).{ value: unresolved_191140d7 ether }Unresolved_0e39a812(var_c); // call
        (bool success, bytes memory ret0) = address(store_a).Unresolved_4c1e69fd(var_b); // staticcall
        if (0x20 > ret0.length) {
        }
        if (0x20 > ret0.length) {
        }
        var_b = address(msg.sender);
        (bool success, bytes memory ret0) = address(unresolved_7f5ddd4c).originAccount(var_b); // staticcall
        require(!0);
        (bool success, bytes memory ret0) = address(store_a).Unresolved_4c1e69fd(var_b); // staticcall
        if (0x20 > ret0.length) {
        }
        if (0x20 > ret0.length) {
        }
        if (0x20 > ret0.length) {
        }
    }
    
    /// @custom:selector    0xedba5d9a
    /// @custom:signature   Unresolved_edba5d9a(address arg0, uint256 arg1, uint256 arg2, uint256 arg3) public payable returns (uint256)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    /// @param              arg1 ["uint256", "bytes32", "int256"]
    /// @param              arg2 ["uint256", "bytes32", "int256"]
    /// @param              arg18446744073709551615 ["uint256", "bytes32", "int256"]
    function Unresolved_edba5d9a(address arg0, uint256 arg1, uint256 arg2, uint256 arg3) public payable returns (uint256) {
        require(msg.value);
        require((msg.data.length + 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc) < 0x60);
        require(arg0 - (address(arg0)));
        require(arg1 - arg1);
        require(arg2 > 0xffffffffffffffff);
        require(!(arg2 + 0x23) < msg.data.length);
        require(arg2 > 0xffffffffffffffff);
        require(((var_c + (uint248((0x20 + (arg2 << 0x05)) + 0x1f))) > 0xffffffffffffffff) | ((var_c + (uint248((0x20 + (arg2 << 0x05)) + 0x1f))) < var_c));
        uint256 var_c = var_c + (uint248((0x20 + (arg2 << 0x05)) + 0x1f));
        require(((arg2 + (arg2 << 0x08)) + 0x24) > msg.data.length);
        require((0x24 + arg2) < ((arg2 + (arg2 << 0x08)) + 0x24));
        require((msg.data.length - (0x24 + arg2)) < 0x0100);
        require(((var_c + 0x0100) > 0xffffffffffffffff) | ((var_c + 0x0100) < var_c));
        var_c = var_c + 0x0100;
        require(msg.data[0x24 + arg2] - (address(msg.data[0x24 + arg2])));
        require(store_i == 0x02, "ReentrancyGuard: reentrant call");
        store_i = 0x02;
        require(!(var_c.length < 0x0a), "inconsistent params length");
        require(0x01);
        require(0x3274b668aed85479e2a8511e74d7db7240ebe7c8 - msg.sender);
        uint256 var_f = address(msg.data[msg.data.length + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffec] >> 0x60);
        (bool success, bytes memory ret0) = address(unresolved_7f5ddd4c).Unresolved_3d76750c(var_f); // staticcall
        require(!0);
        (bool success, bytes memory ret0) = address(store_a).Unresolved_4c1e69fd(var_f); // staticcall
        require(!address(positionRouter).code.length);
        var_f = 0;
        uint256 var_g = 0;
        (bool success, bytes memory ret0) = address(positionRouter).{ value: var_g ether }Unresolved_0e39a812(var_f); // call
        require(!0);
        (bool success, bytes memory ret0) = address(store_a).Unresolved_2a71d166(var_f); // staticcall
        require(!address(unresolved_7f5ddd4c).code.length);
        var_f = 0;
        (bool success, bytes memory ret0) = address(unresolved_7f5ddd4c).{ value: 0 ether }Unresolved_dd2c81e7(var_f); // call
        store_i = 0x01;
        return ;
        require(var_c > 0xffffffffffffffff);
        var_c = var_c;
        require(0);
        store_i = 0x01;
        return ;
        require(0x20 > ret0.length);
        require(((var_c + 0x20) > 0xffffffffffffffff) | ((var_c + 0x20) < var_c));
        var_c = var_c + 0x20;
        require(((var_c + 0x20) - var_c) < 0x20);
        require(var_c > 0xffffffffffffffff);
        require(0x20 > ret0.length);
        require(((var_c + 0x20) > 0xffffffffffffffff) | ((var_c + 0x20) < var_c));
        var_c = var_c + 0x20;
        require(((var_c + 0x20) - var_c) < 0x20);
        require(!address(positionRouter).code.length);
        var_g = 0;
        (bool success, bytes memory ret0) = address(positionRouter).{ value: var_f ether }Unresolved_0e39a812(var_g); // call
        (bool success, bytes memory ret0) = address(store_a).Unresolved_4c1e69fd(var_f); // staticcall
        if (0x20 > ret0.length) {
        }
        if (0x20 > ret0.length) {
        }
        var_f = address(msg.sender);
        (bool success, bytes memory ret0) = address(unresolved_7f5ddd4c).originAccount(var_f); // staticcall
        require(!0);
        (bool success, bytes memory ret0) = address(store_a).Unresolved_4c1e69fd(var_f); // staticcall
        if (0x20 > ret0.length) {
        }
        if (0x20 > ret0.length) {
        }
    }
    
    /// @custom:selector    0x6bd72647
    /// @custom:signature   Unresolved_6bd72647(uint256 arg0, uint256 arg1, uint256 arg2, uint256 arg3, uint256 arg4, uint256 arg5, uint256 arg6, address arg7, uint256 arg8, uint256 arg9, uint256 arg10) public payable returns (uint256)
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    /// @param              arg1 ["uint256", "bytes32", "int256"]
    /// @param              arg2 ["uint256", "bytes32", "int256"]
    /// @param              arg3 ["uint256", "bytes32", "int256"]
    /// @param              arg4 ["uint256", "bytes32", "int256"]
    /// @param              arg5 ["uint256", "bytes32", "int256"]
    /// @param              arg7 ["uint256", "bytes32", "int256"]
    /// @param              arg8 ["address", "uint160", "bytes20", "int160"]
    /// @param              arg9 ["uint256", "bytes32", "int256"]
    /// @param              arg10 ["uint256", "bytes32", "int256"]
    /// @param              arg18446744073709551615 ["uint256", "bytes32", "int256"]
    function Unresolved_6bd72647(uint256 arg0, uint256 arg1, uint256 arg2, uint256 arg3, uint256 arg4, uint256 arg5, uint256 arg6, address arg7, uint256 arg8, uint256 arg9, uint256 arg10) public payable returns (uint256) {
        require(msg.value);
        require((msg.data.length + 0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffc) < 0x0160);
        require(arg3 - arg3);
        require(arg5 - arg5);
        require(arg8 - (address(arg8)));
        require(arg9 - arg9);
        require(arg10 > 0xffffffffffffffff);
        require(arg10 > 0xffffffffffffffff, "DelegateCollection: not trustedForwarder");
        require(((var_c + (uint248(((arg10 + 0x1f) + 0x20) + 0x1f))) > 0xffffffffffffffff) | ((var_c + (uint248(((arg10 + 0x1f) + 0x20) + 0x1f))) < var_c), "DelegateCollection: not trustedForwarder");
        uint256 var_c = var_c + (uint248(((arg10 + 0x1f) + 0x20) + 0x1f));
        require(!arg9, "DelegateCollection: not trustedForwarder");
        require(!(msg.sender == (address(store_a))), "DelegateCollection: not trustedForwarder");
        address var_g = tx.origin;
        (bool success, bytes memory ret0) = address(store_a).Unresolved_6ba42aaa(var_g); // staticcall
        require(!0);
        require(0x3274b668aed85479e2a8511e74d7db7240ebe7c8 - msg.sender);
        var_g = address(msg.data[msg.data.length + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffec] >> 0x60);
        (bool success, bytes memory ret0) = address(unresolved_7f5ddd4c).Unresolved_3d76750c(var_g); // staticcall
        require(!0);
        (bool success, bytes memory ret0) = address(store_a).Unresolved_4c1e69fd(var_g); // staticcall
        require(!address(positionRouter).code.length);
        var_g = 0;
        uint256 var_h = 0;
        (bool success, bytes memory ret0) = address(positionRouter).{ value: var_h ether }Unresolved_0e39a812(var_g); // call
        (bool success, bytes memory ret0) = address(store_a).Unresolved_2a71d166(var_g); // staticcall
        require(!(0 == (address(arg8))), "DelegateCollection: DELEGATE_NOT_APPROVED");
        unresolved_24167157 = (uint248(unresolved_24167157)) | 0x010000000000000000000000000000000000000000;
        unresolved_191140d7 = 0;
        require(!address(unresolved_24167157).code.length);
        var_g = arg0;
        uint256 var_m = 0;
        (bool success, bytes memory ret0) = address(unresolved_24167157).{ value: var_m ether }Unresolved_6bd72647(var_g); // call
        unresolved_24167157 = uint248(unresolved_24167157);
        unresolved_191140d7 = 0;
        return ;
        require(var_c > 0xffffffffffffffff);
        var_c = var_c;
        require(0);
        unresolved_24167157 = uint248(unresolved_24167157);
        unresolved_191140d7 = 0;
        return ;
        require(0x20 > ret0.length);
        require(((var_c + 0x20) > 0xffffffffffffffff) | ((var_c + 0x20) < var_c));
        var_c = var_c + 0x20;
        require(((var_c + 0x20) - var_c) < 0x20);
        require(!(0 == (address(arg8))), "DelegateCollection: DELEGATE_NOT_APPROVED");
        unresolved_24167157 = (uint248(unresolved_24167157)) | 0x010000000000000000000000000000000000000000;
        unresolved_191140d7 = var_c.length;
        require(!address(unresolved_24167157).code.length);
        require(var_c > 0xffffffffffffffff);
        require(0x20 > ret0.length);
        require(((var_c + 0x20) > 0xffffffffffffffff) | ((var_c + 0x20) < var_c));
        var_c = var_c + 0x20;
        require(((var_c + 0x20) - var_c) < 0x20);
        require(!address(positionRouter).code.length);
        var_h = 0;
        (bool success, bytes memory ret0) = address(positionRouter).{ value: var_m ether }Unresolved_0e39a812(var_h); // call
        (bool success, bytes memory ret0) = address(store_a).Unresolved_2a71d166(var_h); // staticcall
        if (0x20 > ret0.length) {
        }
        (bool success, bytes memory ret0) = address(store_a).Unresolved_4c1e69fd(var_g); // staticcall
        if (0x20 > ret0.length) {
        }
        if (0x20 > ret0.length) {
        }
        var_g = address(msg.sender);
        (bool success, bytes memory ret0) = address(unresolved_7f5ddd4c).originAccount(var_g); // staticcall
        require(!0);
        (bool success, bytes memory ret0) = address(store_a).Unresolved_4c1e69fd(var_g); // staticcall
        if (0x20 > ret0.length) {
        }
        if (0x20 > ret0.length) {
        }
        if (0x20 > ret0.length) {
        }
    }
}