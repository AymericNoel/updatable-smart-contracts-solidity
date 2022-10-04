// migrations/2_upgrade_contracts.js
const { upgradeProxy } = require('@openzeppelin/truffle-upgrades');

const Counter = artifacts.require('Counter');
const CounterV2 = artifacts.require('CounterV2');

module.exports = async function (deployer) {
  const existing = await Counter.deployed();
  await upgradeProxy(existing.address, CounterV2, { deployer });
};