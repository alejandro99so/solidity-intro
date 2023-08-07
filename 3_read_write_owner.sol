// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ReadWriteOwner {
    string private myText;
    address public owner;

    constructor() {
        owner = msg.sender;
    }
    function setText(string memory _myText) external {
        if (msg.sender == owner) {
            myText = _myText;
        }
    }
    function getText() external view returns (string memory) {
        return myText;
    }
}