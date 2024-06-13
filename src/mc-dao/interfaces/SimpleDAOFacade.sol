// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import {Schema} from "../storage/Storage.sol";

contract SimpleDAOFacade {
    function propose() external returns(uint256 pid) {}
    function vote(uint256 pid, bool approve) external {}
    function tally(uint256 pid) external {}
    function execute(uint256 pid) external {}
    function create(string memory description) external returns(uint256 pid) {}
    function list() external view returns(Schema.Proposal[] memory) {}
}
