set enable-keypad on
set colored-stats on
set visible-stats on
set -o vi
shopt -s direxpand

files=( ~/.config/bash/bash_aliases ~/.config/bash/bash_functions \
~/.config/bash/bash_exports /etc/bash_completion \
/usr/share/virtualenvwrapper/virtualenvwrapper.sh \
/etc/profile.d/undistract-me.sh ~/.cargo/env)

for FILE in ${files[@]}; do
    [[ -f ${FILE} ]] && source ${FILE}
done

ps -A | grep -e " bspwm$" > /dev/null && source ${XDG_CONFIG_HOME}/bspwm/bspwm_props

if [[ ! -z ${DISPLAY} ]] && [[ -f ~/.Xresources ]]; then
    xrdb -load ~/.Xresources
    if command -v wal >/dev/null; then
        source ~/.cache/wal/colors.sh
        (cat ~/.cache/wal/sequences) &
        xrdb -merge ~/.cache/wal/colors.Xresources
    fi
fi

[[ "${TERM}" != "linux" ]] && [[ -f ${EVEN_BETTER_LS_PATH} ]] && \
    export LS_COLORS=$(python3 ${EVEN_BETTER_LS_PATH})
