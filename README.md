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


##### sepolia
✅  [Success]Hash: 0x54f3c44a393fb25a7d2c03ce451c9b82c619500864813d8384b8b5a20f8c1dcc
Contract Address: 0x9F35f18817b71f2438098148C39d340d30548d76
Block: 6091411
Paid: 0.001888968675718325 ETH (131825 gas * 14.329366021 gwei)


##### sepolia
✅  [Success]Hash: 0x62b416e7dfc8dd7e7c677cd71cf6431a6e34217ae819162da88c198c06f8ba22
Contract Address: 0x7b24859613BaBd86de12843FA1669CbAA3F2e7dD
Block: 6091411
Paid: 0.001717818727963501 ETH (119881 gas * 14.329366021 gwei)


##### sepolia
✅  [Success]Hash: 0xffe01f9477abf7e397c0490ab9ab212c99d8f46d244c80efddf9a8f7ff6c4ad0
Contract Address: 0xBCFAcEe4340aBBe1234076cAfBd3Ded6b6c1c285
Block: 6091411
Paid: 0.001827467036756193 ETH (127533 gas * 14.329366021 gwei)


##### sepolia
✅  [Success]Hash: 0x5d074e2cadf7272551ab0904d968f19d9237bdde3d3115cef5b055e976ee9c4e
Contract Address: 0xBF4e74CfA73996870841706ff3c4c0D886FD5BaF
Block: 6091411
Paid: 0.001554521272788185 ETH (108485 gas * 14.329366021 gwei)


##### sepolia
✅  [Success]Hash: 0x9c8ee9d31009bb0d4e18004a1cfd51826fca1495ed69be8b1f24305729ef6f52
Contract Address: 0x868d874Ad096F1a893d507aDe86F997f59750C66
Block: 6091411
Paid: 0.007568541862435864 ETH (528184 gas * 14.329366021 gwei)


##### sepolia
✅  [Success]Hash: 0x085cd658926c65c58a6478fa4f535487b376c9a7ff8afe2509413cd3e88ac0ff
Block: 6091411
Paid: 0.001378327388193969 ETH (96189 gas * 14.329366021 gwei)


##### sepolia
✅  [Success]Hash: 0x5db8151f8a950e6d4901278468858e63e610e15c8e07f43e3a6d5425cd14eb8e
Block: 6091411
Paid: 0.000897003983548579 ETH (62599 gas * 14.329366021 gwei)


##### sepolia
✅  [Success]Hash: 0x47448b6fe2969b804a38739999c0b3700736c4d4bf4d2fe3797bddf222881b73
Block: 6091411
Paid: 0.000905744896821389 ETH (63209 gas * 14.329366021 gwei)


##### sepolia
✅  [Success]Hash: 0x98523138e1b7a61d844af12bf1448dcd75f697974d74548ec03672a6bfeda75d
Block: 6091411
Paid: 0.000914485810094199 ETH (63819 gas * 14.329366021 gwei)


##### sepolia
✅  [Success]Hash: 0x5682078fb49e7d3cb0ed38332b3e600d5703aedcd6efe58565a37f86cacf3fbd
Block: 6091411
Paid: 0.000676589675413557 ETH (47217 gas * 14.329366021 gwei)


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
