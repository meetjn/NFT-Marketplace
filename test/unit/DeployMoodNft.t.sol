// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {DeployMoodNft} from "../../Script/DeployMoodNft.s.sol";

contract DeployMoodNftTest is Test {
    DeployMoodNft public deployMoodNft;

    function setUp() public {
        deployer = new DeployMoodNft();
    }

    function testConvertSvgToUri() public {
        
    }
}