#!/bin/sh

SCRIPT_DIR=$(cd $(dirname $0); pwd)
ln -Ffhs $SCRIPT_DIR $HOME/.config/frontemare-fzf
