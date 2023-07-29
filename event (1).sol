//SPDX-License-Identifier: MIT

pragma solidity >=0.5.0 < 0.9.0;

contract EventContract{
    struct Event{
        address organiser;
        string name;
        uint date;
        uint price;
        uint ticketCount;
        uint ticketRemain;
    }
    mapping(uint=>Event) public events;
    mapping(address=>mapping(uint=>uint)) public tickets;
    uint public nextId;

    function createEvent(uint date, uint price, uint ticketCount, string memory name) external{
        require(date>block.timestamp, "You can organise the event in future date");
        require(ticketCount>0, "You must have a ticketCount greater to 0, so to proceed with the Event Creation");

        events[nextId] = Event(msg.sender, name, date, price, ticketCount, ticketCount);
        nextId++;
    }
    function buyTickets(uint id, uint quantity) external payable{
        require(events[id].date!=0, "This event does not exist");
        require(events[id].date>block.timestamp , "Event is out of Time to walk in..");
        Event storage _event = events[id];
        require(msg.value==_event.price, "You don't have enough of ethers!");
        require(_event.ticketRemain>=quantity, "Not enough Tickets!");
        _event.ticketRemain-=quantity;
        tickets[msg.sender][id]+=quantity;
    }
    function transferTickets(uint id, uint quantity, address to) public {
        require(events[id].date!=0, "This event does not exist");
        require(events[id].date>block.timestamp , "Event is out of Time to walk in..");
        require(tickets[msg.sender][id]>=quantity, "You do not have enough Tickets");
        tickets[msg.sender][id]-=quantity;
        tickets[to][id]+=quantity;


    }
}