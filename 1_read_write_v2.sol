// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
 
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