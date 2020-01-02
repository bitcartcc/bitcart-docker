#!/usr/bin/env bash
sudo apt install -y git
branch=${1:-master}
rm -rf compose/bitcart && git clone https://github.com/MrNaif2018/bitcart -b $branch compose/bitcart
cd compose/bitcart
cat > conf/.env << EOF
DB_HOST=database
REDIS_HOST=redis://redis
BTC_HOST=bitcoin
LTC_HOST=litecoin
GZRO_HOST=gravity
BSTY_HOST=globalboost
BCH_HOST=bitcoincash
EOF
mkdir -p images
mkdir -p images/products
cd ../..
