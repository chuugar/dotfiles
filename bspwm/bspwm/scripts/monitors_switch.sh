#!/usr/bin/env bash

source ${XDG_CONFIG_HOME}/bspwm/bspwm_props

while getopts 'dntu' OPTION; do
	case ${OPTION} in
		d)
			echo "Dual monitors."
			bspc monitor ${BSPWM_C_HORIZ} -d ${BSPWM_M_HORIZ}
			bspc monitor ${BSPWM_C_VERT} -d ${BSPWM_M_VERT}
			;;
		t)
			echo "Triple monitors."
			bspc monitor ${BSPWM_C_HORIZ} -d ${BSPWM_M_HORIZ}
			bspc monitor ${BSPWM_C_VERT} -d ${BSPWM_M_VERT}
            xrandr --output ${BSPWM_C_TV} --auto --right-of ${BSPWM_C_HORIZ}
			bspc monitor ${BSPWM_C_TV} -d ${BSPWM_M_TV}
			;;
		u)
			echo "Single monitor."
			bspc monitor ${BSPWM_C_VERT} -d ${BSPWM_M_HORIZ} ${BSPWM_M_VERT}
			;;
		*)
			echo "Incorrect argument."
			exit 1
			;;
	esac
done

bspc config top_padding ${BSPWM_TOP_PADDING}
bspc config bottom_padding ${BSPWM_BOTTOM_PADDING}
bspc config left_padding ${BSPWM_LEFT_PADDING}
bspc config right_padding ${BSPWM_RIGHT_PADDING}
