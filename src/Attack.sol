// SPDX-License-Identifier: UNLICENSED
pragma solidity "0.8.19";

// Privacy contract address: 0x58E36e971610187EB15b3206E35DE12BA3ea1792

interface IPrivacy {
    function unlock(bytes16 _key) external;
}

contract Attack {
    IPrivacy privacy;

    constructor(address _addr) {
        privacy = IPrivacy(_addr);
    }

    function unlock(bytes32 _data) external {
        bytes16 data = bytes16(_data);
        privacy.unlock(data);
    }
}
