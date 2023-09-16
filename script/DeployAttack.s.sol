// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import {Attack} from "../src/Attack.sol";

contract DeployAttack is Script {
    function run() external returns (Attack) {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

        address attackAddr = 0x58E36e971610187EB15b3206E35DE12BA3ea1792;

        vm.startBroadcast(deployerPrivateKey);
        Attack attack = new Attack(attackAddr);
        vm.stopBroadcast();

        return (attack);
    }
}

// forge script script/DeployAttack.s.sol:DeployAttack --rpc-url $SEPOLIA_RPC_URL --broadcast --verify -vvvv
