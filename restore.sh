#!/bin/bash

for file in .{path,exports,aliases,functions,extra}; do
  [ -r "$file" ] && [ -f "$file" ] && cp "$file" ~/"$file";
done;
unset file;

for eachtap in $(cat ./brew-tap.list); do
  brew tap "$eachtap"
done;
unset eachtap;

for item in $(cat ./brew-install.list); do
  brew install "$item"
done;

for item in $(cat ./brew-cask-install.list); do
  brew install --cask "$item"
done;
