pragma solidity ^0.8.27;

contract Ticket {
    mapping(string => uint256) public tickets;

    function getTicket(string memory ticketKey) public view returns (uint256) {
        return tickets[ticketKey];
    }

    function setTicket(string memory ticketKey, uint256 _ticket) public {
        tickets[ticketKey] = _ticket;
    }
}
