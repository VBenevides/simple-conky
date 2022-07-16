#!/bin/bash

BASEDIR=$(dirname "$0")
echo "$BASEDIR"

# Move Simple Conky Directory to .conky
mkdir -p $HOME/.conky
cp -r "$BASEDIR/../Simple Conky" "$HOME/.conky/Simple Conky"
rm -rf "$HOME/.conky/Simple Conky/.git"
