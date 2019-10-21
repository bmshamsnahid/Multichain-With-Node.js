const express = require('express');
const app = express();
const bodyParser = require('body-parser');

let exec = require('child_process').exec;

app.get('/get-info', function (req, res) {
  function puts(error, stdout, stderr) { sys.puts(stdout); }
  exec('multichain-cli blockchain-building getinfo', function(err, stdout, stderr) {
    if (!err) {
      console.log(stdout);
      res.send(stdout);
    } else {
      console.log(err);
      res.send(err);
    }
  });
});

app.get('/list-blocks', function (req, res) {
  function puts(error, stdout, stderr) { sys.puts(stdout); }
  exec('multichain-cli blockchain-building listblocks -100', function(err, stdout, stderr) {
    if (!err) {
      console.log(stdout);
      res.send(stdout);
    } else {
      console.log(err);
      res.send(err);
    }
  });
});

const server = app.listen(3000, () => console.log('Server is up and running'));

