// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract TipJar {
    address public owner;
    string public userName;
    uint256 public totalAmount;
    uint256 public donorsCount;

    mapping(address => bool) private hasDonated;

    event Tipped(address indexed donor, uint256 amount);
    event Withdrawn(address indexed owner, uint256 amount);

    constructor(address _owner, string memory _userName) {
        owner = _owner;
        userName = _userName;
    }

    receive() external payable {
        _tip();
    }

    function tip() external payable {
        _tip();
    }

    function _tip() internal {
        require(msg.value > 0, "Must send ETH to tip");
        totalAmount += msg.value;

        if (!hasDonated[msg.sender]) {
            hasDonated[msg.sender] = true;
            donorsCount++;
        }

        emit Tipped(msg.sender, msg.value);
    }

    function withdraw() external {
        require(msg.sender == owner, "Not your jar");
        uint256 amount = totalAmount;
        totalAmount = 0;
        payable(owner).transfer(amount);
        emit Withdrawn(owner, amount);
    }
}