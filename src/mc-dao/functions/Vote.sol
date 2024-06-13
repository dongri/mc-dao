// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import {Storage, Schema} from "../storage/Storage.sol";

contract Vote {
    function vote(uint256 pid, bool approve) external {
        require(pid >= 0, "Vote: invalid proposal id");
        require(pid <= Storage.SimpleDAOState().proposals.length, "Vote: invalid proposal id");
        require(Storage.SimpleDAOState().proposals[pid].isExecuted == false, "Vote: proposal is already executed");
        Schema.Proposal storage proposal = Storage.SimpleDAOState().proposals[pid];
        proposal.totalVoteCount++;
        if (approve) proposal.approvalCount++;
    }
}
