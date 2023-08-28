// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract MyModifierEvent {
    string private myText;
    uint public countChanges = 0;
    address public owner;

    constructor() {
        owner = msg.sender;
        myText = "Hello world";
    }

    modifier onlyOwner {
        require(msg.sender == owner,"Paila");
        _;
    }

    event InfoChange(string oldInfo, string newInfo);

    function setText(string memory _myText) external onlyOwner {
        emit InfoChange (myText, _myText);
        myText = _myText;
        countChanges++;
    } 

    function getText() external view returns (string memory) {
        return myText;
    }   
}