#!/bin/bash

# Ensure that options are never changed and properly set.
readonly outfox_dir="${HOME}/.project-outfox"
readonly pref_ini="${outfox_dir}/Save/Preferences.ini"
mkdir -p $(dirname "${pref_ini}")
touch "${pref_ini}"
sed -e 's/^FullscreenIsBorderlessWindow=.*/FullscreenIsBorderlessWindow=0/g' \
    -e 's/^ShowLoadingWindow=.*/ShowLoadingWindow=0/g' \
    -e 's/^ShowMouseCursor=.*/ShowMouseCursor=0/g' \
    -e 's/^Windowed=.*/Windowed=0/g' \
    -i "${pref_ini}"

# Some soundcards may not be completely detected at startup. Make sure this is
# the case.
/usr/sbin/alsactl restore
