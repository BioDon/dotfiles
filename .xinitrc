# Set cursor theme
export XCURSOR_THEME="Bibata-Modern-Classic"
export XCURSOR_SIZE=24

# Start compositor to prevent screen tearing
picom --daemon &
~/.fehbg &
slstatus &

# Auto terminals on tag 1
st -t term-fastfetch -e sh -c 'fastfetch; exec $SHELL' &
st -t term-btop -e btop &
st -t term-shell &

# Start dwm
exec dwm
