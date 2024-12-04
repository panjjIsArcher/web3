// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.27;

contract Ticket {
    mapping(string => uint256) public tickets;

    // 获取
    function getTicket(string memory ticketKey) public view returns (uint256) {
        return tickets[ticketKey];
    }

    // 设置
    function setTicket(string memory ticketKey, uint256 _ticket) public {
        tickets[ticketKey] = _ticket;
    }
}
