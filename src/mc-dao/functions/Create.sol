// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import {Storage, Schema} from "../storage/Storage.sol";

contract Create {
    function create(string memory description) external returns(uint256 pid) {
        Schema.Proposal[] storage proposals = Storage.SimpleDAOState().proposals;
        proposals.push(Schema.Proposal({
            proposer: msg.sender,
            description: description,
            totalVoteCount: 0,
            approvalCount: 0,
            isApproved: false,
            isExecuted: false
        }));
        pid = proposals.length;
    }
}
