#!/bin/sh

prefix="/usr"
exec_prefix="${prefix}"
xrdb="xrdb"
xinitdir="/etc/X11/xinit"
xclock="xclock"
xterm="xterm"
twm="twm"
xmodmap="xmodmap"

userresources="$HOME/.Xresources"
usermodmap="$HOME/.Xmodmap"
sysresources="$xinitdir/.Xresources"
sysmodmap="$xinitdir/.Xmodmap"

# Kullanmak istediğin pencere yöneticisini burada belirt
WM="bspwm"
# WM="tinywm"
# WM="mwm"

export DESKTOP_SESSION="$WM"

if [ -f "$sysresources" ]; then
    if [ -x /usr/bin/cpp ] ; then
        "$xrdb" -merge "$sysresources"
    else
        "$xrdb" -nocpp -merge "$sysresources"
    fi
fi

if [ -f "$sysmodmap" ]; then
    "$xmodmap" "$sysmodmap"
fi

if [ -f "$userresources" ]; then
    if [ -x /usr/bin/cpp ] ; then
        "$xrdb" -merge "$userresources"
    else
        "$xrdb" -nocpp -merge "$userresources"
    fi
fi

if [ -f "$usermodmap" ]; then
    "$xmodmap" "$usermodmap"
fi

# start some nice programs

if [ -d "$xinitdir"/xinitrc.d ] ; then
	for f in "$xinitdir/xinitrc.d"/?*.sh ; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

# Window Manager'a özel uygulamalar
case "$WM" in
    dwm)
	    #slstatus 2>&1 >/dev/null &
	    #dwmblocks 2>&1 >/dev/null & 
	    $HOME/dwm_blocks.sh &
	    $HOME/.fehbg &
   	    picom --config ~/.config/picom.conf --daemon &
	    #xset led named 'Scroll Lock' &
	    $HOME/.config/conky/Altair/start.sh &
	    /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
	    ;;
    bspwm)
	    #slstatus 2>&1 >/dev/null &
	    #dwmblocks 2>&1 >/dev/null & 
	    $HOME/.fehbg &
   	    picom --config ~/.config/picom.conf --daemon &
	    #xset led named 'Scroll Lock' &
	    $HOME/.config/conky/Altair/start.sh &
	    $HOME/.config/polybar/launch.sh &
	    mpd &
	    mpc listall | mpc add &
	    /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
	    ;;
    tinywm)
	    $HOME/.fehbg &
	    /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & 
	    picom --config ~/.config/picom.conf --daemon &
	    dunst &	
	    #$HOME/.config/conky/Altair/start.sh &
	    #polybar -restart &
	    ;;   
    tintwm)
	    $HOME/.fehbg &
	    /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & 
	    picom --config ~/.config/picom.conf --daemon &
	    dunst &	
	    $HOME/.config/conky/Altair/start.sh &
	    ;;   
    mwm)
	    # dmenu_run -l 10 -p 'Uygulama seç:' -fn 'Terminus-13' -nb '#242933' -sb '#1b1f26' &
	    $HOME/.fehbg &
	    /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & 
	    picom --config ~/.config/picom.conf --daemon &
	    dunst &		    
	    $HOME/.config/conky/Altair/start.sh &
	   # conky &
	    ;;
    *)
        echo "Unknown window manager: $WM"
        ;;
esac

# Son olarak window manager başlat
exec "$WM"

