"use strict";

const http = require('http');
const port = 8080;
const host = '0.0.0.0';

const server = http.createServer( function(req, res) {

    let body = '';

    if (req.method === 'POST' || req.method === 'GET') {
        let body = '';
        req.on('data', function (data) {
            body += data;
        });

        res.writeHead(200, {'Content-Type': 'text'});
        res.end('received request successfully');
    }
    else {
        res.writeHead(405, {'Content-Type': 'text'});
        res.end('not allowed method ' + req.method + ', try again with GET or POST');
    }

    console.log(req.method + ' ' + req.url + " '" + body + "'")
});

server.listen(port, null, function(error){
    if(!!error){
        console.log("\x1b[41m%s\x1b[0m", "error while initializing listener on port " + port + ": " + error);
    }
    else{
        console.log("\x1b[32m%s\x1b[0m", "started listener at 'http://" + host + ':' + port + "'");}
});