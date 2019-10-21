GENESIS BLOCK GENERATED NODE
objective: create instance, for generate genesis node
1. Become super user
    > sudo su
2. install multichain
    (Download -> Extract -> Move File to System Directory)
    > wget https://www.multichain.com/download/multichain-2.0-alpha-5.tar.gz
    > tar -xvzf multichain-2.0-alpha-5.tar.gz
    > cd multichain-2.0-alpha-5
    > mv multichaind multichain-cli multichain-util /usr/local/bin
    > cd ~

3. install node.js
objective: For further interaction from express server
    (Download -> Install in system)
    > curl -sL https://deb.nodesource.com/setup_10.x | bash -
    > apt-get -qy install nodejs
    > ln -s /usr/bin/nodejs /usr/bin/node
    > apt-get -qy install libtool pkg-config build-essential autoconf automake

4. create a genesis block
    > multichain-util create my-blockchain
5. run node
    > multichaind my-blockchain -daemon
6. configure firewall
    (Check port -> allow )
    > cat  /root/.multichain/my-blockchain/params.dat
    And port is assigned under `default-network-port`
    > ufw allow OpenSSH
    > ufw allow in 443/tcp
    > ufw allow in 9237/tcp
    > ufw enable
    > ufw status

    * https for install ssl certification
7. update security group to open the `default network port`

SAMPLE NODE
objective: connect to the node with genesis block
1. Become super user
    > sudo su
2. install multichain
    (Download -> Extract -> Move File to System Directory)
    > wget https://www.multichain.com/download/multichain-2.0-alpha-5.tar.gz
    > tar -xvzf multichain-2.0-alpha-5.tar.gz
    > cd multichain-2.0-alpha-5
    > mv multichaind multichain-cli multichain-util /usr/local/bin
    > cd ~
3. install node.js
objective: For further interaction from express server
    (Download -> Install in system)
    > curl -sL https://deb.nodesource.com/setup_10.x | bash -
    > apt-get -qy install nodejs
    > ln -s /usr/bin/nodejs /usr/bin/node
    > apt-get -qy install libtool pkg-config build-essential autoconf automake
4. Get chain
    > multichaind my-blockchain@ip_with_genesis_block:port
    (With value)> multichaind my-blockchain@172.31.80.36:9237

GENESIS BLOCK GENERATED NODE
objective: Grant permission
    > multichain-cli my-blockchain grant wallet-address connect,send,receive,mine,create

    ref: https://www.multichain.com/developers/permissions-management/


Sample Node:
objective: Write create a block with some json data
1. after permission granted, run the node
   > multichaind my-blockchain -daemon
1. go to interactive mode
    > multichain-cli my-blockchain
2. create stream
    ** might need to subscribe to the chain
    > create stream my-blockchain-stream
2. write in streams
    > publish my-blockchain-stream "json" '{"some key":"some value"}'


GENESIS BLOCK GENERATED NODE
objective: read the data
1. go to interactive mode
    > multichain-cli my-blockchain
2. subscribe to the chain
    > subscribe my-blockchain true
3. read data
    > liststreamitems my-blockchain