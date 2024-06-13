// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import {Storage, Schema} from "../storage/Storage.sol";

contract List {
    function list() external view returns(Schema.Proposal[] memory) {
        return Storage.SimpleDAOState().proposals;        
    }
}
