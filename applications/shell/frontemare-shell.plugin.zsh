FRONTEMARE_SHELL=$(dirname ${(%):-%x})
[ -n "$PS1" ] && [ -s $FONETMARE_SHELL/profile_helper.sh ] && eval "$($FRONTEMARE_SHELL/profile_helper.sh)"
