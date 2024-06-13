# MC DAO
```
$ forge init mc-dao -t metacontract/template
....
Receiving objects: 100% (313/313), 71.35 KiB | 288.00 KiB/s, done.
Resolving deltas: 100% (130/130), done.
    Initialized forge project
$ 
```

## Add src/mc-dao
* functions
* interfaces
* storage

## test
```
$ forge test
...
Ran 1 test for test/mc-dao/SimpleDAO.i.t.sol:SimpleDAOIntegrationTest
[PASS] test_success_scenario() (gas: 151848)
Suite result: ok. 1 passed; 0 failed; 0 skipped; finished in 11.84ms (74.50µs CPU time)

Ran 6 test suites in 133.15ms (34.14ms CPU time): 10 tests passed, 0 failed, 0 skipped (10 total tests)
$ 
```

# deploy
```
$ cp .env.sample .env
$ vim .env
DEPLOYER_PRIV_KEY=0x{private key}

$ forge script script/Deploy.s.sol
[⠆] Compiling...
No files changed, compilation skipped
Script ran successfully.
Gas used: 19080321

$ forge script script/Deploy.s.sol --rpc-url https://sepolia.infura.io/v3/{project id}
## Setting up 1 EVM.
Error:
Failed to get EIP-1559 fees

$ forge script script/Deploy.s.sol --rpc-url https://sepolia.infura.io/v3/{project id} --legacy

Chain 11155111

Estimated gas price: 15.175182262 gwei

Estimated total gas used for script: 2195600

Estimated amount required: 0.0333186301744472 ETH

==========================

SIMULATION COMPLETE. To broadcast these transactions, add --broadcast and wallet configuration(s) to the previous command. See forge script --help for more.

$ forge script script/Deploy.s.sol --rpc-url https://sepolia.infura.io/v3/{project id} --legacy --broadcast
##### sepolia
✅  [Success]Hash: 0x33f6b5655b92b719a0c03a4287010db18d9fd7defc73a6bf49a75a07b74c9c58
Contract Address: 0x908aeD0b0bB345b7b43E1789c5f76b744316394c
Block: 6091411
Paid: 0.001273608381312501 ETH (88881 gas * 14.329366021 gwei)
.....
##### sepolia
✅  [Success]Hash: 0x74217450cb7e1ee6bd91fe9261fb994a7e1c152f24f672c33fe267c20f5d5373
Contract Address: 0x9D8153063957EB5DF081873c04e92ad57CBB0c47
Block: 6091411
Paid: 0.002792248921584102 ETH (194862 gas * 14.329366021 gwei)

==========================

ONCHAIN EXECUTION COMPLETE & SUCCESSFUL.
Total Paid: 0.023395326632630364 ETH (1632684 gas * avg 14.329366021 gwei)
```

## Get ABI
```
$ forge inspect SimpleDAOFacade abi
[
  {
    "type": "function",
    "name": "execute",
    "inputs": [
      {
        "name": "pid",
        "type": "uint256",
        "internalType": "uint256"
      }
    ],
    "outputs": [],
    "stateMutability": "nonpayable"
  },
  {
    "type": "function",
    "name": "propose",
    "inputs": [],
    "outputs": [
      {
        "name": "pid",
        "type": "uint256",
        "internalType": "uint256"
      }
    ],
    "stateMutability": "nonpayable"
  },
  {
    "type": "function",
    "name": "tally",
    "inputs": [
      {
        "name": "pid",
        "type": "uint256",
        "internalType": "uint256"
      }
    ],
    "outputs": [],
    "stateMutability": "nonpayable"
  },
  {
    "type": "function",
    "name": "vote",
    "inputs": [
      {
        "name": "pid",
        "type": "uint256",
        "internalType": "uint256"
      },
      {
        "name": "approve",
        "type": "bool",
        "internalType": "bool"
      }
    ],
    "outputs": [],
    "stateMutability": "nonpayable"
  }
]
```

## development web app
```
$ cd web
$ vim public/js/script.js
const ContractABI = [........]
const ContractAddress = '0x9D8153063957EB5DF081873c04e92ad57CBB0c47';

$ docker-compose up -d
```
http://localhost/
