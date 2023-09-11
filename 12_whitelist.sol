// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract MyWhiteList {
    string private myText;
    address public owner;
    mapping (address => bool) public whiteList;

    constructor() {
        owner = msg.sender;
        whiteList[msg.sender] = true;
        myText = "Hello world";
    }
    
    modifier onlyOwner {
        require(msg.sender == owner,"Only owner");
        _;
    }

    modifier onlyWhitelist {
        require(whiteList[msg.sender] == true, "Only whitelist");
        _;
    }

    function setText(string memory _myText) external onlyWhitelist {
        myText = _myText;
    }

    function addMember (address member) external onlyOwner {
        whiteList[member] = true;
    }

    function delMember (address member) external onlyOwner {
        whiteList[member] = false;
    }

    function getText() external view returns (string memory) {
        return myText;
    }

}