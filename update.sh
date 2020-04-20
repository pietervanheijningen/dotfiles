#!/usr/bin/env bash

cp ~/.zshrc .zshrc
git add .
git commit -m "Update @ `date`"
git push
