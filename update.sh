#!/usr/bin/env bash

cp ~/.zshrc .zshrc
cp ~/.vimrc .vimrc
git add .
git commit -m "Update @ $(date)"
git push
