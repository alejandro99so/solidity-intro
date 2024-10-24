// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract MyEvent {
    string private myText;
    address private owner;
    constructor() {
        owner = msg.sender;
    }
    event InfoChange(string oldInfo, string newInfo);
    function setText(string memory _myText) external {
        emit InfoChange(myText, _myText);
        require(owner == msg.sender, "paila only owner");
        myText = _myText;
    }

    function getText() external view returns (string memory) {
        return myText;
    }
}
