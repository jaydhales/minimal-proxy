// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

// contract Proxy {
//     uint256 public a;
//     uint256 public b;
//     address immutable impl;

//     constructor(address _impl) {
//         impl = _impl;
//     }

//     fallback() external payable {
//         bytes calldata _data = msg.data;
//         (bool success,) = impl.delegatecall(_data);
//         require(success);
//     }
// }
// pragma solidity ^0.8.24;

contract Proxy {
    address owner;
    address public implementation;

    constructor(address _implementation) {
        implementation = _implementation;
        owner = msg.sender;
    }

    fallback() external payable {
        require(msg.sender == owner, "Caller is not the owner");
        (bool success,) = implementation.delegatecall(msg.data);
        require(success, "Delegatecall failed");
    }
}
