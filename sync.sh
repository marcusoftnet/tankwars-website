#!/bin/bash
echo "=>Rebuilding"
jekyll build

echo "=>Copying to website folder"
cp -R _site/ ~/Projects/tankwars

echo "=>Deploying"
cd ~/Projects/tankwars
git add -A && git commit -m "Regenerated"
git push origin HEAD

echo "=>Back to this directory"
cd ~/Projects/tankwars-website