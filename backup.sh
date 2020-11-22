#!/bin/bash

for file in ~/.{path,exports,aliases,functions,extra,gitignore,gitconfig}; do
  [ -r "$file" ] && [ -f "$file" ] && cp "$file" .;
done;
unset file;

brew list --formula -1 > ./brew-install.list
brew list --cask -1 > ./brew-cask-install.list

