# Create your first permissioned blockchain platform in 30 minutes

[Multichain](https://www.multichain.com/) a is open source, bitcoin forked, permissioned blockchain solution.

- Rather than public blockchain, like [Ethereum](https://*www.ethereum.org) or [bitcoin](https://bitcoin.org/en/), the transactions and activities are kept private to the selected participants.

* Admin/Admins can make sure, which participants can connect to the blockchain and even read or write on the platform.

- With all these goodies, although PoW is optional here, we can also include wallets, assets and create our own currency.

## Objectives

In this article, using multichain, we will create a permissioned blockchain solution.

- Create two nodes
- Each node will have a copy of chain
- We tweak some permission between these nodes
- Create a block data in the first node chain and Make sure, that block data is available in the sibling node chain

## Prerequisites:

- Two ubuntu instances (AWS EC2 is used here)

Before we start, please create 2 ubuntu instances under same network. Let's call the first one `origin_node` and the second one `sibling_1` node.
| Node | Job |
| ----------- | ----------- |
| origin_node | Genesis node will be created here, Admin node |
| sibling_1 | Has permission to connect and write to the chain |

For creating instance, please consider the following criteria

- Use ubuntu 16.04 server

* Use a security group that allows
  - `HTTPS` 443
  - `SSH` 22
  - `Custom TCP` `8333`

## Prepare origin_node:

Objective of this section is create a genesis node and run the chain.
SSH to your `origin_node`.

```sh
ssh ubuntu@origin_node_public_ip -i key
```

Become a root user

```sh
sudo su
```

Download multichain

```sh
wget https://www.multichain.com/download/multichain-2.0-alpha-5.tar.gz
```

Extract files:

```sh
tar -xvzf multichain-2.0-alpha-5.tar.gz
```

Move files to binary directory

```sh
cd multichain-2.0-alpha-5
mv multichaind multichain-cli multichain-util /usr/local/bin
```

Return to `home` directory

```sh
cd ~
```

Create a genesis node

```sh
multichain-util create my-blockchain
```

Update default network and rpc port to `8333` and `8332`

```sh
nano /root/.multichain/my-blockchain/params.dat
```

You can use the `default network port`. But you have to ensure to put the port explicitly in next command.

> Now run the node

```sh
multichaind my-blockchain -daemon
```

> You will get response like,

```
Other nodes can connect to this node using:
multichaind my-blockchain@origin_node_ip:8333
```

Now configure `HTTPS` and `default network port` firewall.

`HTTPS` for syncing and interacting other nodes and
`default network port` to connect with other nodes.

```sh
ufw allow OpenSSH
ufw allow in 443/tcp
ufw allow in 8333/tcp
ufw enable
ufw status
```

We successfully run a multichain node.

## Prepare a sibling node:

Just like the previous `origin_node` install multichain.

```sh
ssh ubuntu@origin_node_public_ip -i key
sudo su
wget https://www.multichain.com/download/multichain-2.0-alpha-5.tar.gz
tar -xvzf multichain-2.0-alpha-5.tar.gz
cd multichain-2.0-alpha-5
mv multichaind multichain-cli multichain-util /usr/local/bin
cd ~
```

Initialize chain from `origin_node`

```sh
multichaind my-blockchain@private_ip_of_origin_node:8333
```

Now you should get a wallet address for further transaction.

Great, one sibling node is initialized.

Right now it's chain is initialized. But it does not have any permission for connect or write to the chain.

## Grant Permission from `origin_node`:

We will grant Permission of `sibling_node` for connect and write to the chain.

From the `origin_node`, grant permission to connect and write,

```sh
multichain-cli my-blockchain grant sibling_1_node_wallet_address connect,send,receive,mine,create
```

Since permission is granted, now we can connect and write data to the chain from `sibling_1` node.

## Write Some Data From Sibling Node

Go to your `sibling_1` and connect to the chain,

```sh
multichaind my-blockchain -daemon
```

To write some `json` data, go to `interactive` mode,

```sh
multichain-cli my-blockchain
```

Create a `stream` to mine some block,

```sh
create stream my-blockchain-stream true
```

Write data through the `stream`

```sh
publish my-blockchain-stream "json" '{"json":{"myKey":"myValue"}}'
```

Make sure, there is no `space` between the `colon`, `cottation` or `brackets`

It's time to check, chain is synced among all the nodes.

## Verify Chain Data in `origin_node`

Now the chain data should synced through all the nodes.
To check this, Go to the `origin_node` and check if the data block exists in the chain.
In the `origin_node`,
Go to interactive mode,

```sh
multichain-cli my-blockchain
```

Subscribe to the `stream`

```sh
subscribe my-blockchain-stream true
```

Now your data should be displayed

```sh
liststreamitems my-blockchain-stream
```

You will get output something like this,

```json
[
  {
    "publishers": ["1aokp3bti15AuRs51wPemtBuiqAdRDFaGYnRQw"],
    "keys": ["json"],
    "offchain": false,
    "available": true,
    "data": {
      "json": {
        "myKey": "myValue"
      }
    },
    "confirmations": 4,
    "blocktime": 1571709550,
    "txid": "transaction_id"
  }
]
```

## Wrap Up:

### References:

- Video Course: https://www.udemy.com/course/build-blockchain-deploy-private-blockchain/
- Official Getting Started: https://www.multichain.com/getting-started/

* Permissions: https://www.multichain.com/developers/permissions-management/
* Runtime Parameters: https://www.multichain.com/developers/runtime-parameters/

### Exercise:

- Create 2nd sibling with read permission and read chain
- Create 3rd sibling with write permission and verify chain
- Integrate a express server
