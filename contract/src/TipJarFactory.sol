// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./TipJar.sol";

contract TipJarFactory {
    TipJar[] public allTipJars;
    mapping(address => address) public userJar;

    event JarCreated(address indexed owner, address jarAddress, string userName);

    function createJar(string calldata _userName) external {
        require(userJar[msg.sender] == address(0), "You already have a jar");

        TipJar newJar = new TipJar(msg.sender, _userName);

        allTipJars.push(newJar);
        userJar[msg.sender] = address(newJar);

        emit JarCreated(msg.sender, address(newJar), _userName);
    }

    function getUserJar(address _user) external view returns (address) {
        return userJar[_user];
    }

    function getAllJars() external view returns (TipJar[] memory) {
        return allTipJars;
    }
}
