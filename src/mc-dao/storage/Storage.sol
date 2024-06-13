// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import {Schema} from "./Schema.sol";

library Storage {
    function SimpleDAOState() internal pure returns(Schema.$SimpleDAOState storage ref) {
        assembly { ref.slot := 0x50aba8fd53ad3f15589914385ca5a8acbbbda217710817ca522dc735bd37a77f }
    }
}
