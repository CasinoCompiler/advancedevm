// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract CallAnything {
    address public s_address;
    uint256 public s_amount;

    function transfer(address _address, uint256 _amount) public {
        s_address = _address;
        s_amount = _amount;
    } 

    function firstWayToGetSelector() public pure returns(bytes4 selector){
        selector = bytes4(keccak256(bytes("transfer(address,uint256)")));
    }

    function getDataToCallTransfer(address _address, uint256 _amount) public pure returns(bytes memory){
        return abi.encodeWithSelector(firstWayToGetSelector(), _address, _amount);
    }

    function callTransferFunctionUsingBinary(address _address, uint256 _amount) public returns(bytes4, bool){
        (bool success, bytes memory returnData) = address(this).call(
            getDataToCallTransfer(_address, _amount)
        );
        return (bytes4(returnData), success); 
    }

    function callTransferFunctionUsingBinarySig(address _address, uint256 _amount) public returns(bytes4, bool){
        (bool success, bytes memory returnData) = address(this).call(
            abi.encodeWithSignature("transfer(address,uint256)", _address, _amount)
        );
        return (bytes4(returnData), success); 
    }
}