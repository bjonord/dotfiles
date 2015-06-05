#!/bin/zsh To ensure that the caps setting lives through suspends and
# shut downs, changes were made in dconf editor.
# http://askubuntu.com/questions/410499/make-setxkbmap-preferences-being-set-at-startup

# If an explicit layout is provided as an argument, use it. Otherwise, select the next layout from
# the set [us(colemak), us(altgr-intl), se].
if [[ $1 == "-q" ]]; then
elif [[ -n "$1" ]]; then
    setxkbmap $1 -variant $2
else
    layout=$(setxkbmap -query | awk '$1 ~/layout/ {print $2}')
    variant=$(setxkbmap -query | awk '$1 ~/variant/ {print $2}')
    case $layout$variant in
        uscolemak)
            setxkbmap us -variant altgr-intl -option caps:ctrl_modifier
            ;;
        *)
            setxkbmap us -variant colemak -option caps:ctrl_modifier
            ;;
    esac
fi

result=$(setxkbmap -query | awk '$1 ~/(layout|variant)/ {print $2}')
echo $result
