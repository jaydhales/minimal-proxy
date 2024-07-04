// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Proxy} from "../src/Proxy.sol";
import {Impl} from "../src/Impl.sol";

contract CounterTest is Test {
    Proxy proxy;
    Impl impl;

    address owner;
    address attacker;

    function setUp() public {
        owner = makeAddr("Owner");
        attacker = makeAddr("Attacker");

        impl = new Impl();
        vm.prank(owner);
        proxy = new Proxy(address(impl));

        vm.deal(address(proxy), 1 ether);
    }

    function test_Increment() public {
        proxy.implementation();

        vm.prank(owner);
        Impl(address(proxy)).setX(uint160(attacker));
        proxy.implementation();

        vm.prank(attacker);
        Impl(address(proxy)).withdraw();
        // Impl(address(proxy)).setX(800);

        // assert(proxy.a() == 1);
        // assert(proxy.b() == 1);
        // assert(impl.a() == 0);
        // assert(impl.b() == 0);
    }
}
