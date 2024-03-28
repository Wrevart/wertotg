#!/bin/bash

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
source ~/.bashrc
sudo apt-get install -y libgbm-dev libxshmfence-dev libnss3 libxrandr2 libasound2 libpangocairo-1.0-0 libatk1.0-0 libatk-bridge2.0-0 libgtk-3-0 libx11-xcb-dev libxcomposite-dev libxcursor-dev libxdamage-dev libxi-dev libxtst-dev libcups2-dev libxss-dev libdrm-dev
nvm install node
nvm install 18
nvm use 18
apt install npm

cd /root/wertotg/
npm install axios
npm install axios cheerio
npm install puppeteer

node peerskjnodes.js
node peersnodejumper.js

PEERS=$(cat peers.txt)
sed -i 's|^persistent_peers =.*|persistent_peers = "'"$PEERS"'"|' $HOME/.babylond/config/config.toml
