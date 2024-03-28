#!/bin/bash

wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
nvm install node
apt install npm

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

npm install axios
npm install axios cheerio

node /root/wertotg/peerskjnodes.js

node /root/wertotg/peersnodejumper.js

PEERS=$"(cat peers.txt)"
sed -i 's|^persistent_peers =.|persistent_peers = "'$PEERS'"|' $HOME/.babylond/config/config.toml
cd 
