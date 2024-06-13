// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import {Storage, Schema} from "../storage/Storage.sol";

contract Execute {

    function execute(uint256 pid) external {
        require(!Storage.SimpleDAOState().proposals[pid].isExecuted, "Execute: proposal is already executed");
        Storage.SimpleDAOState().proposals[pid].isExecuted = true;
    }
}
