// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import {MCTest, MCDevKit} from "@mc/devkit/Flattened.sol";
import {DeployLib} from "../../script/DeployLib.sol";

import {Storage} from "bundle/mc-dao/storage/Storage.sol";
import {SimpleDAOFacade} from "bundle/mc-dao/interfaces/SimpleDAOFacade.sol";

contract SimpleDAOIntegrationTest is MCTest {
    using DeployLib for MCDevKit;
    SimpleDAOFacade public simpleDAO;

    function setUp() public {
        simpleDAO = SimpleDAOFacade(mc.deploySimpleDAO().toProxyAddress());
    }

    function test_success_scenario() public {
        uint256 _pid = simpleDAO.propose();
        assertEq(_pid, 0);

        simpleDAO.vote(_pid, true);
        simpleDAO.tally(_pid);
        simpleDAO.execute(_pid);

        assertEq(
            vm.load(address(simpleDAO), 0x50aba8fd53ad3f15589914385ca5a8acbbbda217710817ca522dc735bd37a77f),
            bytes32(uint256(1))
        );
    }

}
