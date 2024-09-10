// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title
 * @author
 * @notice
 * @dev
 */

/**
 * Imports
 */
// @Order Imports, Interfaces, Libraries, Contracts

contract Encoding {
    /**
     * Errors
     */

    /**
     * Type Declarations
     */

    /**
     * State Variables
     */

    /**
     * Events
     */

    /**
     * Constructor
     */

    /**
     * Modifiers
     */

    /**
     * Functions
     */
    // @Order recieve, fallback, external, public, internal, private
    receive() external payable {}
    fallback() external payable {}

    function combineStrings() public pure returns (string memory) {
        return string(abi.encodePacked("Hi mom,", "I love you!"));
    }

    function encodeNumber() public pure returns (bytes memory) {
        return abi.encode(1);
    }

    function encodeString() public pure returns (bytes memory) {
        string memory someString = ("Some string");
        return abi.encode(someString);
    }

    function encodePackString() public pure returns (bytes memory) {
        string memory someString = ("Some string");
        return abi.encodePacked(someString);
    }

    function bytesVsEncodePackedComparison() public pure returns (bytes memory) {
        string memory someString = ("Some string");
        return bytes(someString);
    }

    function decodeString() public pure returns (string memory) {
        return abi.decode(encodeString(), (string));
    }

    function multiEncode() public pure returns (bytes memory) {
        bytes memory someString = abi.encode("Some string", "But bigger");
        return someString;
    }

    function multiDecode() public pure returns (string memory, string memory) {
        (string memory someString, string memory someOtherString) = abi.decode(multiEncode(), (string, string));
        return (someString, someOtherString);
    }

    function multiPackedEncode() public pure returns (bytes memory) {
        bytes memory someString = abi.encodePacked("Some string", "But bigger");
        return someString;
    }

    function multiPackedDecode() public pure returns (string memory) {
        return string(multiPackedEncode());
    }

    /**
     * Getter Functions
     */
}
