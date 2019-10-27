// rpcuser=multichainrpc
// rpcpassword=BtKMa3Aqs1tqLQNUJYEfWQ2FjeLQquvL7xBL5QzHQKHL

let multichain = require("multichain-node")({
  port: 8332,
  host: '54.144.208.138',
  user: "multichainrpc",
  pass: "BtKMa3Aqs1tqLQNUJYEfWQ2FjeLQquvL7xBL5QzHQKHL"
});

multichain.getInfo((err, info) => {
  if(err){
      throw err;
  }
  console.log(info);
})


// update security and ufw for port 8332
// /root/.multichain/my-blockchain/multichain.conf should be
// rpcuser=user
// rpcpassword=password
// rpcallowip=0.0.0.0/0 // added this line
