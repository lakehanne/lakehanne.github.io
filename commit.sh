#!/bin/bash

# commits a change and pushes a change
git add --all;

echo "\nHello "$USER". please enter the commit message: "

read msg

git commit -m "$msg"


printf "\nPlease enter the name of the upstream remote \n\n Or simply type Enter to push to master branch\n\n "

read remote

if [ remote == "" ]; then
   remote=master
fi

git push -u origin $remote

printf "\n\n"
