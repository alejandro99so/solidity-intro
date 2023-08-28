// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract MyModifier {
    string private myText;
    address public owner;
    uint256 public balance;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner");
        balance = address(this).balance;
        _;
    }

    function setText(string memory _myText) external onlyOwner {
        myText = _myText;
    }

    function getText() external view returns (string memory) {
        return myText;
    }

    function setTextPremium(string memory _myText)
        public
        payable
        validateTransaction
    {
        myText = _myText;
    }

    modifier validateTransaction() {
        require(msg.value > 0, "Pague o yaper");
        _;
    }
}
