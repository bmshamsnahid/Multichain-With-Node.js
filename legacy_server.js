const express = require('express');
const app = express();
const { promisify } = require('util');
const exec = promisify(require('child_process').exec);

app.get('/get-info', async (req, res) => {
  const { err, stdout, stderr } = await exec(
    'multichain-cli my-blockchain getinfo'
  );

  if (err) {
    return res.send(err);
  }

  if (stdout) {
    return res.send(stdout);
  }

  if (stderr) {
    return res.send(stderr);
  }
});

app.get('/get-data', async (req, res) => {
  await exec(
    'multichain-cli my-blockchain subscribe my-blockchain-stream true'
  );

  const { err, stdout, stderr } = await exec(
    'multichain-cli my-blockchain liststreamitems my-blockchain-stream'
  );

  if (err) {
    return res.send(err);
  }

  if (stdout) {
    return res.send(stdout);
  }

  if (stderr) {
    return res.send(stderr);
  }
});

app.get('/get-write-data', async (req, res) => {
  await exec(
    'multichain-cli my-blockchain subscribe my-blockchain-stream true'
  );

  const { err, stdout, stderr } = await exec(
    'multichain-cli my-blockchain publish my-blockchain-stream "from node server" 48656C6C6F20576F726C64210A'
  );

  if (err) {
    return res.send(err);
  }

  if (stdout) {
    return res.send(stdout);
  }

  if (stderr) {
    return res.send(stderr);
  }
});

app.listen(3000, () => console.log('Server is up and running'));
