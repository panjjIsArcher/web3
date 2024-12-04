// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.27;

import "./Ticket.sol";

contract Vote {
    Ticket public ticket;
    uint256 public endTime; // 结束时间
    mapping(address => bool) public voted;

    constructor(uint256 _endTime) {
        endTime = _endTime;
        ticket = new Ticket();
    }

    // vote count
    function vote(string memory _ticketKey) public expired(endTime) isVoted {
        voted[msg.sender] = true; // 该用户已提交
        uint256 value = ticket.getTicket(_ticketKey); // 获取
        ticket.setTicket(_ticketKey, value + 1); // 更新
    }

    modifier expired(uint256 _endTime) {
        require(block.timestamp < _endTime, "expired"); // 日期校验
        _;
    }

    modifier isVoted() {
        require(!voted[msg.sender], "voted"); // 防止重复
        _;
    }
}
