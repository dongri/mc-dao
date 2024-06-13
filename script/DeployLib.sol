// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import {MCDevKit} from "@mc/devkit/Flattened.sol";
// Bundle interface
import {SimpleDAOFacade} from "bundle/mc-dao/interfaces/SimpleDAOFacade.sol";
// Functions
import {Propose} from "bundle/mc-dao/functions/Propose.sol";
import {Vote} from "bundle/mc-dao/functions/Vote.sol";
import {Tally} from "bundle/mc-dao/functions/Tally.sol";
import {Execute} from "bundle/mc-dao/functions/Execute.sol";

// Plus Create and List functions by dongri
import {Create} from "bundle/mc-dao/functions/Create.sol";
import {List} from "bundle/mc-dao/functions/List.sol";

library DeployLib {
    function bundleName() internal returns(string memory) {
        return "SimpleDAO";
    }

    function deploySimpleDAO(MCDevKit storage mc) internal returns(MCDevKit storage) {
        mc.init(bundleName());
        mc.use("Propose", Propose.propose.selector, address(new Propose()));
        mc.use("Vote", Vote.vote.selector, address(new Vote()));
        mc.use("Tally", Tally.tally.selector, address(new Tally()));
        mc.use("Execute", Execute.execute.selector, address(new Execute()));

        // Plus Create and List functions by dongri
        mc.use("Create", Create.create.selector, address(new Create()));
        mc.use("List", List.list.selector, address(new List()));

        mc.useFacade(address(new SimpleDAOFacade()));
        mc.deploy();
        return mc;
    }
}
