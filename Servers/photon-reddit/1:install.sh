#!/bin/sh

set -e

source 0:.env.sh

git clone --depth=1 -b \
    tryout https://NUCintosh.local:3000/shh/photon-reddit \
    photon-reddit:tryout

cd photon-reddit:tryout
npm install
npm run build
cd ..

rm -f dist
ln -s photon-reddit:tryout/dist
cp 0:.env.sh dist/.env
