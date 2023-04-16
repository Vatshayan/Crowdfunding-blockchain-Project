
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract CrowdFunding {
    address public owner; // owner of the contract
    uint256 public minimumContribution; // minimum contribution required for contributor to do crowd funding.
    uint256 public deadline; // Final Time to do crowdfunding.
    uint256 public target;
    uint256 public raisedAmount; // Keep track of the total raised amount.
    uint256 public totalContributors; // total contributors who have contributed to crowd funding.
    uint256 public numRequests;

    struct Request {
        string description;
        address payable recipient;
        uint256 value;
        bool completed;
        uint256 noOfVoters;
        mapping(address => bool) voters;
    }

    mapping(uint256 => Request) public allRequests;
    mapping(address => uint256) public contributors; // key value pair of contributors address and fund they have contributed.

    constructor(uint256 _target, uint256 _deadline) {
        owner = msg.sender;
        deadline = block.timestamp + _deadline;
        target = _target;
        minimumContribution = 100 wei;
    }

    // All Modifiers starts here --------------------------------------------------
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can access this function.");
        _;
    }

    modifier isDeadlinePassed() {
        require(
            block.timestamp < deadline,
            "Crowd Funding deadline has passed. Please try again later."
        );
        _;
    }

    modifier isContributor() {
        require(contributors[msg.sender] > 0, "Sorry, you are not a contributor. Try to contribute to crowd funding then try again. Thanks.");
        _;
    }

    // All Modifiers Ends here --------------------------------------------------

    // get balance
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    // Contribute
    function contribute() public payable isDeadlinePassed {

    }

    // Refund the money if the target is not fulfilled and deadline has passed.
    function refund() public isDeadlinePassed isContributor {

    }

    // Create Request
    function createRequest(

    }

    // vote request.
    function voteRequest(uint256 _requestNo) public isContributor {

    }

    // make payemnt only if the voters are greater than half of the contributors.
    function makePayment(uint _requestNo) public onlyOwner{



    }
}
