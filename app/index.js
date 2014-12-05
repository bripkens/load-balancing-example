var express = require('express');
var bodyParser = require('body-parser');
var logger = require('morgan');

var app = express();
var healthy = true;

app.use(logger('combined'));

app.use(bodyParser.json());

app.get('/', function(req, res) {
  res.send('Hello World!');
});

app.get('/health', function(req, res) {
  res.send(healthy ? 'I am fine!' : 'I am feeling sick...');
});

app.put('/health', function(req, res) {
  healthy = req.body.healthy;
  res.send('Thanks, health status got updated to ' + healthy);
});

var server = app.listen(process.env.PORT || 3000, function() {
  var host = server.address().address;
  var port = server.address().port;
  console.log('App listening at http://%s:%s', host, port)
});
