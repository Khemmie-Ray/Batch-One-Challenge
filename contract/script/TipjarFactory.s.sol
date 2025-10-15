// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import {Script, console} from "forge-std/Script.sol";
import {TipJarFactory} from "../src/TipJarFactory.sol";

contract CounterScript is Script {
    TipJarFactory public tipjarfactory;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        tipjarfactory = new TipJarFactory();

        vm.stopBroadcast();
    }
}
