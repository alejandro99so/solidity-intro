// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.19;

contract ReadWrite {
    string private myText;
    function setText(string memory _myText) external {
        myText = _myText;
    }
    function getText() external view returns (string memory) {
        return myText;
    }
}
