// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";


contract CounterV2 is Initializable {
    // This example follow the tutorial found on OpenZeppelin website: https://docs.openzeppelin.com/learn/upgrading-smart-contracts?pref=truffle
    // uint256 public shoudGoWrong; //overwrite previous state variable
    uint256 public currentValue;

    function store(uint256 newValue) public {
        require(newValue > 20, "value too small");
        currentValue = newValue;
    }

    function increment(uint256 incrementer) public {
        require(incrementer <= 10, "value too high");
        currentValue += incrementer;
    }

    function decrement(uint256 decrementer) public {
        currentValue -= decrementer;
    }
}
