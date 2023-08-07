// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ReadWriteRequire {
    string private myText;
    address public owner;
    uint public countChanges = 0;

    constructor() {
        owner = msg.sender;
    }
    function setText(string memory _myText) external {
        countChanges++;
        require(msg.sender == owner, "Only owner");
        myText = _myText;
    }
    function getText() external view returns (string memory) {
        return myText;
    }   
}