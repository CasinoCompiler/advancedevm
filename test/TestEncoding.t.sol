// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test, console} from "@forge/src/Test.sol";
import {Encoding} from "../src/Encoding.sol";
import {DeployEncoding} from "../script/DeployEncoding.s.sol";

contract TestEncoding is Test {
    DeployEncoding deployEncoding;
    Encoding encoding;

    function setUp() public {
        deployEncoding = new DeployEncoding();
        encoding = deployEncoding.run();
    }

    function test_combineStrings() public view {
        string memory combinedStrings = encoding.combineStrings();
        console.log(combinedStrings);
    }

    function test_differentEncodings() public view {
        console.log("1 Encoded:");
        console.logBytes(encoding.encodeNumber());
        console.log("String Encoded:");
        console.logBytes(encoding.encodeString());
        console.log("string Encoded packed:");
        console.logBytes(encoding.encodePackString());
        console.log("string type casted as byte:");
        console.logBytes(encoding.bytesVsEncodePackedComparison());
        console.log("Decode encodeString():");
        console.log(encoding.decodeString());
        console.log("String multi Encoded:");
        console.logBytes(encoding.multiEncode());
        console.log("Mult decode:");
        (string memory someString, string memory someOtherString) = encoding.multiDecode();
        console.log(someString);
        console.log(someOtherString);
        console.log("String multi Packed Encoded:");
        console.logBytes(encoding.multiPackedEncode());
        console.log("Multi packed string decoded:");
        console.log(encoding.multiPackedDecode());
    }
}
