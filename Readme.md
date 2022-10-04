# Updatable solidity smart contracts

## Concepts
Normally, if you want to deploy smart contracts on evm chains (cf. Ethereum, Polygon, etc...) you have to make sure that functions are strong and final because once pushed, you can't modify them.

So, thanks to [proxies smart contracts](https://docs.openzeppelin.com/contracts/4.x/api/proxy) we can decorrelate functions and storage in order to update functions if necessary. 


## How to test the repository

1. Launch *ganache-cli* locally: `npx ganache-cli`. 

    It will launch a blockchain locally in order to test functionalities of the contracts. **So be careful to open a new terminal during the next steps and to never close this one.**

2. Deploy the first version of the smart contract: `npx truffle migrate --from 1 --to 1 --network ganache --reset`
    
   Now you can interact with your newly deployed contract with `npx truffle console --network ganache`:

   ```js
    var counter = await Counter.deployed();

    (await counter.currentValue().toString());

    await counter.increment(10);

    (await counter.currentValue().toString());
   ```

3. Deploy the second version of the smart contract: `npx truffle migrate --from 2 --to 2 --network ganache`
    
   Now you can interact with your newly deployed contract with `npx truffle console --network ganache` and can observe that the storage is the same than the previous one but with the new functions:

   ```js
    var counter = await Counter.deployed();

    var counterV2 = await CounterV2.at(counter.address);

    (await counter.currentValue().toString());

    await counter.decrement(3);
    
    (await counter.currentValue().toString());
   ```