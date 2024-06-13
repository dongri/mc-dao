// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import {MCTest} from "@mc/devkit/Flattened.sol";
import {Execute} from "bundle/mc-dao/functions/Execute.sol";
import {Storage, Schema} from "bundle/mc-dao/storage/Storage.sol";

contract ExecuteTest is MCTest {
    function setUp() public {
        _use(Execute.execute.selector, address(new Execute()));
    }

    function test_execute_success() public {
        Storage.SimpleDAOState().proposals.push(Schema.Proposal({
            proposer: address(this),
            description: "test",
            totalVoteCount: 0,
            approvalCount: 0,
            isApproved: true,
            isExecuted: false
        }));

        Execute(target).execute(0);

        assertEq(Storage.SimpleDAOState().proposals.length, 1);
    }

    function test_execute_fail() public {
        Storage.SimpleDAOState().proposals.push(Schema.Proposal({
            proposer: address(this),
            description: "test",
            totalVoteCount: 0,
            approvalCount: 0,
            isApproved: false,
            isExecuted: true
        }));

        vm.expectRevert("Execute: proposal is already executed");
        Execute(target).execute(0);
        
    }

}
