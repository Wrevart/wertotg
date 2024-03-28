#!/bin/bash

wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
nvm install node

npm install axios
npm install axios cheerio

node peerskjnodes.js

node peersnodejumper.js
