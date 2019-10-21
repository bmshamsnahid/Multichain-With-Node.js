echo "------------------------------------------------"
echo "Super user                                   "
echo "------------------------------------------------"
echo ""
sudo su
echo "------------------------------------------------"
echo "                                   "
echo "------------------------------------------------"
echo ""
wget https://www.multichain.com/download/multichain-2.0-alpha-5.tar.gz
tar -xvzf multichain-2.0-alpha-5.tar.gz
cd multichain-2.0-alpha-5
mv multichaind multichain-cli multichain-util /usr/local/bin
cd ~

echo "------------------------------------------------"
echo "Super user                                   "
echo "------------------------------------------------"
echo ""
multichain-util create my-blockchain
echo "------------------------------------------------"
echo "Super user                                   "
echo "------------------------------------------------"
echo ""
cat /root/.multichain/my-blockchain/params.dat
default-network-port = 8333             # Default TCP/IP port for peer-to-peer connection with other nodes.
default-rpc-port = 8332                 # Default TCP/IP port for incoming JSON-RPC API requests.
echo "------------------------------------------------"
echo "Super user                                   "
echo "------------------------------------------------"
echo ""
multichaind my-blockchain -daemon       # multichaind my-blockchain@172.31.92.200:8333


echo "------------------------------------------------"
echo "Super user                                   "
echo "------------------------------------------------"
echo ""
````
Other nodes can connect to this node using:
multichaind my-blockchain@172.31.92.200:8333
````
echo "------------------------------------------------"
echo "Super user                                   "
echo "------------------------------------------------"
echo ""
ufw allow OpenSSH
ufw allow in 443/tcp
ufw allow in 8333/tcp
ufw enable
ufw status


echo "------------------------------------------------"
echo "Super user                                   "
echo "------------------------------------------------"
echo ""
sudo su
wget https://www.multichain.com/download/multichain-2.0-alpha-5.tar.gz
tar -xvzf multichain-2.0-alpha-5.tar.gz
cd multichain-2.0-alpha-5
mv multichaind multichain-cli multichain-util /usr/local/bin
cd ~

echo "------------------------------------------------"
echo "Super user                                   "
echo "------------------------------------------------"
echo ""
multichaind my-blockchain@ip_with_genesis_block:8333
multichaind my-blockchain@ip_with_genesis_block:8333


echo "------------------------------------------------"
echo "Super user                                   "
echo "------------------------------------------------"
echo ""
multichain-cli my-blockchain grant wallet-address connect,send,receive,mine,create

echo "------------------------------------------------"
echo "Super user                                   "
echo "------------------------------------------------"
echo ""
multichaind my-blockchain -daemon
multichain-cli my-blockchain
create stream my-blockchain-stream true
publish my-blockchain-stream "json" '{"json":{"myKey":"myValue"}}'


multichain-cli my-blockchain
subscribe my-blockchain-stream true
liststreamitems my-blockchain
