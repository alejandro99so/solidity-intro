// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.19;

contract Global_info {
    function getTimeStamp() external view returns (uint256) {
        return block.timestamp;
    }
    function getBlockNumber() external view returns (uint256) {
        return block.number;
    }
    function getChainId() external view returns (uint256) {
        return block.chainid;
    }
    function getAmount() external payable returns (uint256) {
        return msg.value;
    }
    function getCaller() external view returns (address) {
        return msg.sender;
    }
    function getTrxOrigin() external view returns (address) {
        return tx.origin;
    }

    
}