#!/usr/bin/env sh

# abort on errors
set -e

# build
webdev build

#add dist folder to repo
git stash
git checkout gh-pages
cd build
cp index.html ../
cp main.dart.js ../
cp -r packages ../
cd ..
git add index.html main.dart.js packages/
git commit -m "deployed at `date`"
git push origin gh-pages
git checkout master
git stash pop
echo "==========================="
echo "SUCCESS"
echo "==========================="
