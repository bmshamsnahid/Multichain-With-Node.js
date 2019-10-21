sudo su
wget https://www.multichain.com/download/multichain-2.0-alpha-5.tar.gz
tar -xvzf multichain-2.0-alpha-5.tar.gz
cd multichain-2.0-alpha-5
mv multichaind multichain-cli multichain-util /usr/local/bin
cd ~

curl -sL https://deb.nodesource.com/setup_10.x | bash -
apt-get -qy install nodejs
ln -s /usr/bin/nodejs /usr/bin/node
apt-get -qy install libtool pkg-config build-essential autoconf automake

multichain-util create my-blockchain
multichaind my-blockchain -daemon
cat /root/.multichain/my-blockchain/params.dat
ufw allow OpenSSH
ufw allow in 443/tcp
ufw allow in 9237/tcp
ufw enable
ufw status

sudo su
wget https://www.multichain.com/download/multichain-2.0-alpha-5.tar.gz
tar -xvzf multichain-2.0-alpha-5.tar.gz
cd multichain-2.0-alpha-5
mv multichaind multichain-cli multichain-util /usr/local/bin
cd ~

curl -sL https://deb.nodesource.com/setup_10.x | bash -
apt-get -qy install nodejs
ln -s /usr/bin/nodejs /usr/bin/node
apt-get -qy install libtool pkg-config build-essential autoconf automake
multichaind my-blockchain@ip_with_genesis_block:port
multichaind my-blockchain@172.31.80.36:9237

multichain-cli my-blockchain grant wallet-address connect,send,receive,mine,create

multichaind my-blockchain -daemon
multichain-cli my-blockchain
create stream my-blockchain-stream
publish my-blockchain-stream "json" '{"some key":"some value"}'


multichain-cli my-blockchain
subscribe my-blockchain true
liststreamitems my-blockchain
