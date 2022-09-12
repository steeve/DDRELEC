#!/bin/sh
readonly save_folder="${HOME}/.project-outfox/Save"
readonly pref_ini="${save_folder}/Preferences.ini"
mkdir -p "${save_folder}"
touch "${pref_ini}"
sed -i 's/ShowMouseCursor=.*/ShowMouseCursor=0/g' "${pref_ini}"
sed -i 's/Windowed=.*/Windowed=0/g' "${pref_ini}"
sed -i 's/FullscreenIsBorderlessWindow=.*/FullscreenIsBorderlessWindow=0/g' "${pref_ini}"
exec /opt/outfox/OutFox
