const { defaultRpcPort, hostAddress, user, pass } = require('./config/dev');

let multiChainInstance = require('multichain-node')({
  port: defaultRpcPort,
  host: hostAddress,
  user,
  pass
});

const getInfo = multiChain => {
  multiChain.getInfo((err, info) => {
    if (err) {
      throw err;
    }
    console.log(info);
  });
};

const publish = (multiChain, stream, key, newData) => {
  multiChain.publish(
    {
      stream,
      key,
      data: {
        json: newData
      }
    },
    (err, info) => {
      console.log('Response: ');
      console.log(info);
    }
  );
};

const getData = (
  multiChain,
  stream,
  verbose = false,
  count = 10,
  localOrdering = false
) => {
  multiChain.listStreamItems(
    {
      stream,
      verbose,
      count,
      'local-ordering': localOrdering
    },
    (err, info) => {
      console.log('Response: ');
      info.map(i => console.log(i));
    }
  );
};

const stopMultiChain = multiChain => {
  multiChain.stop();
};

const getRuntimeParams = multiChain => {
  multiChainInstance.getRuntimeParams(console.log);
};

const getBlockchainParams = multiChain => {
  multiChainInstance.getBlockchainParams(console.log);
};

getInfo(multiChainInstance);

// update security and ufw for port 8332
// /root/.multichain/my-blockchain/multichain.conf should be
// rpcuser=user
// rpcpassword=password
// rpcallowip=0.0.0.0/0 // added this line
