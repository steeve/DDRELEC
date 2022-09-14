#!/bin/bash
readonly outfox_dir="/storage/.project-outfox"
readonly outfox_tmp="/tmp/outfox"
readonly outfox_preferences="${outfox_dir}/Save/Preferences.ini"

function preferences_file {
    mkdir -p $(dirname "${outfox_preferences}")
    touch "${outfox_preferences}"
    echo "${outfox_preferences}"
}

# Setup the tmpdir for OutFox
mkdir -p "${outfox_tmp}"

# Logs go in tmpfs
mkdir -p "${outfox_tmp}/Logs"
ln -n -f -s "${outfox_tmp}/Logs" "${outfox_dir}/Logs"

# Configure default preferences
sed \
    -e 's/^FullscreenIsBorderlessWindow=.*/FullscreenIsBorderlessWindow=0/g' \
    -e 's/^LightsDriver=.*/LightsDriver=SextetStreamToFile/g' \
    -e 's/^ShowLoadingWindow=.*/ShowLoadingWindow=0/g' \
    -e 's/^ShowMouseCursor=.*/ShowMouseCursor=0/g' \
    -e 's/^Windowed=.*/Windowed=0/g' \
    -i "$(preferences_file)"

# Some soundcards may not be completely detected at startup. Make sure this is
# the case.
/usr/sbin/alsactl restore --force --ignore || true
