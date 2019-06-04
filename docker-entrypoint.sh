#!/bin/sh

REPO="https://$GITHUB_KEY@github.com/lepsipraha7/cityvizor.git"
git config --global user.email "bot@lepsipraha7.cz"
git config --global user.name "LepsiPraha7 import bot"

cd /source &&
echo "Fetching from github.com..." &&
git pull origin source &&
cd .. &&
echo "Fetching from praha7.cz..." &&
./fetcher.sh &&
echo "Pushing to github.com..." &&
cd /source &&
git add -A &&
git diff --quiet &&
git diff --staged --quiet ||
(git commit -am 'Auto imported new data' && git push $REPO source)
