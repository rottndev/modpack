#!/bin/sh

if [ ! -d "github" ]; then
    mkdir github
    pushd github
    git init
    git remote add origin git@github.com:MarioSMB/modpack.git
    git fetch
    git checkout -b develop
    popd
fi

rsync -Pha --delete \
    --exclude 'github' --exclude 'sync.sh' --exclude '.git' \
    . ../qcsrc \
    github

REV=$(git describe)

pushd github
git add .
git commit -m "Sync with ${REV}"
git push -u origin develop
popd