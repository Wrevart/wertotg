#!/bin/bash

wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
nvm install node
apt install npm

cd /root/wertotg/
npm install axios
npm install axios cheerio

node peerskjnodes.js

node peersnodejumper.js
PEERS=$"(cat peers.txt)"
sed -i 's|^persistent_peers =.|persistent_peers = "'$PEERS'"|' $HOME/.babylond/config/config.toml
cd 
