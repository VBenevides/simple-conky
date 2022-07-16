#!/bin/bash

BASEDIR=$(pwd)

# Move Simple Conky Directory to .conky
mkdir -p $HOME/.conky
cp -r "$BASEDIR" "$HOME/.conky/Simple Conky"
rm -rf "$HOME/.conky/Simple Conky/.git"
