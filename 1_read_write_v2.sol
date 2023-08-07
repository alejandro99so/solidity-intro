// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.19;
 
contract ReadWritev2 {
    string private myText;
    uint public countChanges = 0;
    function setText(string memory _myText) external {
        myText = _myText;
        countChanges++;
    }
    function getText() external view returns (string memory ) {
        return myText;
    }
}