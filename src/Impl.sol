// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

// contract Impl {
//     uint256 public a;
//     uint256 public b;

//     function increaseA() public {
//         a = a + 1;
//     }

//     function increaseB() public {
//         b = b + 1;
//     }
// }

contract Impl {
    uint160 public x;

    function setX(uint160 _x) public {
        x = _x;
    }

    function withdraw() public {
        payable(msg.sender).transfer(1 ether);
    }
}
