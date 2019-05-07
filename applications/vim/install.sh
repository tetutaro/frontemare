#!/bin/sh

SCRIPT_DIR=$(cd $(dirname $0); pwd)
ln -Ffhs $SCRIPT_DIR/colors $HOME/.vim/colors
