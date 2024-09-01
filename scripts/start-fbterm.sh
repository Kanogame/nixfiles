echo -ne "\e[?25]"
fbv -ciuker "$1" << EOF
q
EOF
shift
export FBTERM_BACKGROUND_IMAGE=1
exec fbterm "$@"
