// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract MyArray {
    string[] private myTexts;

    function addText(string memory _mytext) external returns (uint index) {
        myTexts.push(_mytext);
        index = myTexts.length -1;
    }

    function updateInfo(uint index, string memory newText) external {
        require (index < myTexts.length, "invalid index");
        myTexts[index] = newText;
    }

    function getOneText(uint index) external view returns (string memory) {
        require (index < myTexts.length, "invalid index");
        return myTexts[index];
    }

    function listAllText() external view returns (string[] memory) {
        return myTexts;
    } 
}