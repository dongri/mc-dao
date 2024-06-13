// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

/**
 * Schema v0.1.0
 */
library Schema {
    /// @custom:storage-location erc7201:SimpleDAO.SimpleDAOState
    struct $SimpleDAOState {
        Proposal[] proposals;
    }

    struct Proposal {
        address proposer;
        string description;
        uint256 totalVoteCount;
        uint256 approvalCount;
        bool isApproved;
        bool isExecuted;
    }
}
