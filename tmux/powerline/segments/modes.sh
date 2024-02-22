# Indicator of pressing TMUX prefix, copy and insert modes.
# More compact version of mode_indicator

TMUX_POWERLINE_MODES_PREFIX_TEXT_DEFAULT="PREFIX PRESSED"
TMUX_POWERLINE_MODES_INSERT_TEXT_DEFAULT="INSERT"
TMUX_POWERLINE_MODES_COPY_TEXT_DEFAULT="COPY"
TMUX_POWERLINE_MODES_COPY_TEXT_DEFAULT="NORMAL"
TMUX_POWERLINE_MODES_SEPARATOR_TEXT_DEFAULT="✤ "

TMUX_POWERLINE_MODES_PREFIX_COLOR_DEFAULT="colour226"
TMUX_POWERLINE_MODES_NORMAL_COLOR_DEFAULT="colour16"
TMUX_POWERLINE_MODES_COPY_COLOR_DEFAULT="colour82"
TMUX_POWERLINE_MODES_BG_COLOR_DEFAULT="colour33"

generate_segmentrc() {
	read -d '' rccontents  << EORC
# Prefix pressed text
export TMUX_POWERLINE_MODES_PREFIX_TEXT="${TMUX_POWERLINE_MODES_PREFIX_TEXT_DEFAULT}"
# Insert mode text
export TMUX_POWERLINE_MODES_INSERT_TEXT="${TMUX_POWERLINE_MODES_INSERT_TEXT_DEFAULT}"
# Copy mode text
export TMUX_POWERLINE_MODES_COPY_TEXT="${TMUX_POWERLINE_MODES_COPY_TEXT_DEFAULT}"
# Normal mode text
export TMUX_POWERLINE_MODES_NORMAL_TEXT="${TMUX_POWERLINE_MODES_NORMAL_TEXT_DEFAULT}"
# Separator text
export TMUX_POWERLINE_MODES_SEPARATOR_TEXT="${TMUX_POWERLINE_MODES_SEPARATOR_TEXT_DEFAULT}"

# Prefix pressed color
export TMUX_POWERLINE_MODES_PREFIX_COLOR="${TMUX_POWERLINE_MODES_PREFIX_COLOR_DEFAULT}"
# Insert mode color
export TMUX_POWERLINE_MODES_NORMAL_COLOR="${TMUX_POWERLINE_MODES_NORMAL_COLOR_DEFAULT}"
# Copy mode color
export TMUX_POWERLINE_MODES_COPY_COLOR="${TMUX_POWERLINE_MODES_COPY_COLOR_DEFAULT}"
# Background color
export TMUX_POWERLINE_MODES_BG_COLOR="${TMUX_POWERLINE_MODES_BG_COLOR_DEFAULT}"
EORC
	echo "$rccontents"
}

__process_settings() {
    # Text
	if [ -z "$TMUX_POWERLINE_MODES_PREFIX_TEXT" ]; then
		export TMUX_POWERLINE_MODES_PREFIX_TEXT="${TMUX_POWERLINE_MODES_PREFIX_TEXT_DEFAULT}"
	fi
	if [ -z "$TMUX_POWERLINE_MODES_INSERT_TEXT" ]; then
		export TMUX_POWERLINE_MODES_INSERT_TEXT="${TMUX_POWERLINE_MODES_INSERT_TEXT_DEFAULT}"
	fi
	if [ -z "$TMUX_POWERLINE_MODES_COPY_TEXT" ]; then
		export TMUX_POWERLINE_MODES_COPY_TEXT="${TMUX_POWERLINE_MODES_COPY_TEXT_DEFAULT}"
	fi
	if [ -z "$TMUX_POWERLINE_MODES_NORMAL_TEXT" ]; then
		export TMUX_POWERLINE_MODES_NORMAL_TEXT="${TMUX_POWERLINE_MODES_NORMAL_TEXT_DEFAULT}"
	fi

    # Color
	if [ -z "$TMUX_POWERLINE_MODES_PREFIX_COLOR" ]; then
		export TMUX_POWERLINE_MODES_PREFIX_COLOR="${TMUX_POWERLINE_MODES_PREFIX_COLOR_DEFAULT}"
	fi
	if [ -z "$TMUX_POWERLINE_MODES_NORMAL_COLOR" ]; then
		export TMUX_POWERLINE_MODES_NORMAL_COLOR="${TMUX_POWERLINE_MODES_NORMAL_COLOR_DEFAULT}"
	fi
	if [ -z "$TMUX_POWERLINE_MODES_COPY_COLOR" ]; then
		export TMUX_POWERLINE_MODES_COPY_COLOR="${TMUX_POWERLINE_MODES_COPY_COLOR_DEFAULT}"
	fi
	if [ -z "$TMUX_POWERLINE_MODES_NORMAL_COLOR" ]; then
		export TMUX_POWERLINE_MODES_NORMAL_COLOR="${TMUX_POWERLINE_MODES_NORMAL_COLOR_DEFAULT}"
	fi
	if [ -z "$TMUX_POWERLINE_MODES_BG_COLOR" ]; then
		export TMUX_POWERLINE_MODES_BG_COLOR="${TMUX_POWERLINE_MODES_BG_COLOR_DEFAULT}"
	fi
}

run_segment() {
    bgcolor="#[bg=${TMUX_POWERLINE_MODES_BG_COLOR}]"
    normal_fg="#[fg=${TMUX_POWERLINE_MODES_NORMAL_COLOR}]"
    prefix="#[fg=${TMUX_POWERLINE_MODES_PREFIX_COLOR}]${TMUX_POWERLINE_MODES_PREFIX_TEXT}"
    normal="${normal_fg}${TMUX_POWERLINE_MODES_NORMAL_TEXT}"
    copy="#[fg=${TMUX_POWERLINE_MODES_COPY_COLOR}]${TMUX_POWERLINE_MODES_COPY_TEXT}"
    insert="${normal_fg}${TMUX_POWERLINE_MODES_INSERT_TEXT}"
    separator="${TMUX_POWERLINE_MODES_SEPARATOR_TEXT}"

    prefix_indicator="${bgcolor}#{?client_prefix,${prefix},${normal}}"
    normal_or_copy_indicator="${bgcolor}#{?pane_in_mode,${copy},${insert}}"
    echo $prefix_indicator"${normal_fg}${separator}"$normal_or_copy_indicator
    return 0
}
