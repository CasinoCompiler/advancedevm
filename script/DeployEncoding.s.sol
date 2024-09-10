// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script} from "../lib/forge-std/src/Script.sol";
import {Encoding} from "../src/Encoding.sol";

contract DeployEncoding is Script {
    function run() external returns (Encoding) {
        vm.startBroadcast();
        Encoding encoding = new Encoding();
        vm.stopBroadcast();
        return encoding;
    }
}
