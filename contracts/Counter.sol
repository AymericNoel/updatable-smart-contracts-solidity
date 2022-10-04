// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";

contract Counter is Initializable {
    // This example follow the tutorial found on OpenZeppelin website: https://docs.openzeppelin.com/learn/upgrading-smart-contracts?pref=truffle
    uint256 public currentValue;

    function initialize(uint initializedValue) public initializer {
        currentValue = initializedValue;
    }

    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() initializer {}

    function store(uint256 newValue) public {
        require(newValue > 10, "value too small");
        currentValue = newValue;
    }

    function increment(uint256 incrementer) public {
        require(incrementer <= 10, "value too high");
        currentValue += incrementer;
    }
}
