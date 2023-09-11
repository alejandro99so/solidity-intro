// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract MyArrayConditional {
    string[] private myTexts;

    constructor() {
        myTexts.push ("Info 1 on index 0");
        myTexts.push ("Info 2 on index 1");
        myTexts.push ("Info 3 on index 2");
        myTexts.push ("Info 4 on index 3");
    }

    function addText(string memory _myText) external returns (uint index) {
        myTexts.push(_myText);
        index = myTexts.length -1;
    }

    function updateText(uint index, string memory newText) external {
        require (index < myTexts.length, "invalid index");
        myTexts[index] = newText;
    }

    function getOneText(uint index) external view returns (string memory) {
        require (index < myTexts.length, "invalid index");
        return myTexts[index];
    }

    function listAllInfo() external view returns (string[] memory) {
        return listText(0, myTexts.length-1);
    }

    function listText(uint start, uint end) public view returns (string[] memory) {
        if (end > myTexts.length)
            end = myTexts.length-1;
        require (start <= end, "start must <= end");
        uint totalNewArray = end - start + 1;
        string[] memory newArray = new string[](totalNewArray);
        for (uint i = start; i <= end; i++) {
            newArray[i-start] = myTexts[i];
        }
        return newArray;
    }
}