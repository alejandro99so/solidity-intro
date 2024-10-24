// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract MyEnum {
    
    //enum Colors {Undefined = 0, Blue = 1, Red = 2}
    enum Colors {Undefined, Blue, Red}
    Colors infoColor;
    string myText;

    function setText(Colors myColor, string memory myInfo) external {
        infoColor = myColor;
        myText = myInfo;
    }

    function setUndefined(Colors myColor, string memory myInfo) external {
        require(myColor == Colors.Undefined, "Color not exist");
        infoColor = myColor;
        myText = myInfo;
    }

    function getText() external view returns (string memory, Colors) {
        return (myText, infoColor);
    }
}