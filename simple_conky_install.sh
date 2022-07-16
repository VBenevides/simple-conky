#!/bin/bash

BASEDIR=$(dirname "$0")
echo "$BASEDIR"

# Move Simple Conky Directory to .conky
#mkdir -p $HOME/.conky
cp -R "$BASEDIR/Simple Conky" "$BASEDIR/Simple Conky"
