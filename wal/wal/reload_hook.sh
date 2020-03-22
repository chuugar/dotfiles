#!/usr/bin/env bash

source ${HOME}/.cache/wal/colors.sh
source ${XDG_CONFIG_HOME}/bspwm/bspwm_props

YOFFSET=$(( $BSPWM_TOP_PADDING + $BSPWM_WINDOW_GAP + $BSPWM_BORDER_WIDTH ))
XOFFSET=$(( $BSPWM_RIGHT_PADDING + $BSPWM_WINDOW_GAP ))

reload_panel(){
    pkill lemonbar
    panel.sh &
}

reload_bspwm(){
    bspc config normal_border_color "${color0}"
    bspc config active_border_color "${color9}"
    bspc config focused_border_color "${color7}"
}

reload_dunst() {
    # [{width}]x{height}][+/-{x}+/-{y}]
    pkill dunst
    trap '/usr/bin/dunst \
        -conf ${XDG_CONFIG_HOME}/dunst/dunstrc \
        -frame_width 0 \
        -geometry ${DUNST_WIDTH}x${DUNST_HEIGHT}-${XOFFSET}+${YOFFSET} \
        -lb "${color0}" \
        -nb "${background}" \
        -cb "${color0}" \
        -lf "${foreground}" \
        -bf "${color7}" \
        -cf "${color7}" \
        -nf "${color7}" &' EXIT
}

set_wallpaper(){
    [[ -z ${BSPWM_WALLPAPER} ]] && hsetroot -solid "${color6}"
}

reload_panel
reload_bspwm
reload_dunst 
set_wallpaper
