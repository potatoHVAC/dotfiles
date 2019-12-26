# i3 config file (v4)
#
# Please see https://i3wm.org/docs/userguide.html for a complete reference!
#
# This config file uses keycodes (bindsym) and was written for the QWERTY
# layout.
#
# To get a config file with the same key positions, but for your current
# layout, use the i3-config-wizard
#

# Font for window titles. Will also be used by the bar unless a different font
# is used in the bar {} block below.
font pango:monospace 12

# This font is widely installed, provides lots of unicode glyphs, right-to-left
# text rendering and scalability on retina/hidpi displays (thanks to pango).
#font pango:DejaVu Sans Mono 8

# use these keys for focus, movement, and resize directions when reaching for
# the arrows is not convenient
set $up k
set $down j
set $left h
set $right l

# use Mouse+Mod4 to drag floating windows to their wanted position
floating_modifier Mod4

# start a terminal
bindsym Mod4+Return exec i3-sensible-terminal

# kill focused window
bindsym Mod4+Escape kill

# start dmenu (a program launcher)
bindsym Mod4+semicolon exec dmenu_run
# There also is the (new) i3-dmenu-desktop which only displays applications
# shipping a .desktop file. It is a wrapper around dmenu, so you need that
# installed.
# bindsym Mod4+d exec --no-startup-id i3-dmenu-desktop

# change focus
bindsym Mod4+$left focus left
bindsym Mod4+$down focus down
bindsym Mod4+$up focus up
bindsym Mod4+$right focus right

# move focused window
bindsym Mod4+Shift+$left move left
bindsym Mod4+Shift+$down move down
bindsym Mod4+Shift+$up move up
bindsym Mod4+Shift+$right move right

# alternatively, you can use the cursor keys:
bindsym Mod4+Shift+Left move left
bindsym Mod4+Shift+Down move down
bindsym Mod4+Shift+Up move up
bindsym Mod4+Shift+Right move right

# split in horizontal orientation
bindsym Mod4+n split h

# split in vertical orientation
bindsym Mod4+m split v

# enter fullscreen mode for the focused container
bindsym Mod4+u fullscreen toggle

# change container layout (stacked, tabbed, toggle split)
###bindsym Mod4+s layout stacking
###bindsym Mod4+w layout tabbed
bindsym Mod4+i layout toggle split

# toggle tiling / floating
bindsym Mod4+Shift+space floating toggle

# change focus between tiling / floating windows
bindsym Mod4+space focus mode_toggle

# focus the parent container
###bindsym Mod4+a focus parent

# focus the child container
#bindsym Mod4+d focus child

# move the currently focused window to the scratchpad
bindsym Mod4+Shift+minus move scratchpad

# Show the next scratchpad window or hide the focused scratchpad window.
# If there are multiple scratchpad windows, this command cycles through them.
bindsym Mod4+minus scratchpad show

# Define names for default workspaces for which we configure key bindings later on.
# We use variables to avoid repeating the names in multiple places.
set $wsR "Human"
set $wsF "Com"
set $wsV "Server"
set $wsQ " 11:Q "
set $wsA " 21:A "
set $wsZ " 31:Z "
set $wsW " 12:W "
set $wsS " 22:S "
set $wsX " 32:X "
set $wsE " 13:E "
set $wsD " 23:D "
set $wsC " 33:C "

# Define monitors
set $mlap eDP-1
set $m1 HDMI-1
set $m2 DP-2

# Set default workspaces
workspace $wsQ output $mlap
workspace $wsA output $mlap
workspace $wsZ output $mlap
workspace $wsW output $m1
workspace $wsS output $m1
workspace $wsX output $m1
workspace $wsE output $m2
workspace $wsD output $m2
workspace $wsC output $m2
workspace $wsR output $mlap
workspace $wsF output $mlap
workspace $wsV output $m2

# Set workspace wallpaper
exec --no-startup-id feh --bg-scale ~/Pictures/wallpaper/work.jpg

# switch to workspace
bindsym Mod4+q workspace $wsQ
bindsym Mod4+a workspace $wsA
bindsym Mod4+z workspace $wsZ
bindsym Mod4+w workspace $wsW
bindsym Mod4+s workspace $wsS
bindsym Mod4+x workspace $wsX
bindsym Mod4+e workspace $wsE
bindsym Mod4+d workspace $wsD
bindsym Mod4+c workspace $wsC
bindsym Mod4+r workspace $wsR
bindsym Mod4+f workspace $wsF
bindsym Mod4+v workspace $wsV

# move focused container to workspace
bindsym Mod4+Shift+q move container to workspace $wsQ
bindsym Mod4+Shift+a move container to workspace $wsA
bindsym Mod4+Shift+z move container to workspace $wsZ
bindsym Mod4+Shift+w move container to workspace $wsW
bindsym Mod4+Shift+s move container to workspace $wsS
bindsym Mod4+Shift+x move container to workspace $wsX
bindsym Mod4+Shift+e move container to workspace $wsE
bindsym Mod4+Shift+d move container to workspace $wsD
bindsym Mod4+Shift+c move container to workspace $wsC
bindsym Mod4+Shift+r move container to workspace $wsR
bindsym Mod4+Shift+f move container to workspace $wsF
bindsym Mod4+Shift+v move container to workspace $wsV

# move workspace to focused monitor
# TO DO WORK
###bindsym Mod4+Shift+q move workspace to output right

# move focuse to monitor
bindsym Mod4+1 focus output $mlap
bindsym Mod4+F1 focus output $mlap
bindsym Mod4+2 focus output $m1
bindsym Mod4+F2 focus output $m1
bindsym Mod4+3 focus output $m2
bindsym Mod4+F3 focus output $m2

# reload the configuration file
###bindsym Mod4+Shift+c reload
# restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym Mod4+Shift+y restart
# exit i3 (logs you out of your X session)
bindsym Mod4+Shift+Escape exec i3-msg exit

# resize window (you can also use the mouse for that)
mode "resize" {
        # These bindings trigger as soon as you enter the resize mode

        # Pressing left will shrink the window’s width.
        # Pressing right will grow the window’s width.
        # Pressing up will shrink the window’s height.
        # Pressing down will grow the window’s height.
        bindsym $left       resize shrink width 10 px or 10 ppt
        bindsym $down       resize grow height 10 px or 10 ppt
        bindsym $up         resize shrink height 10 px or 10 ppt
        bindsym $right      resize grow width 10 px or 10 ppt

        # same bindings, but for the arrow keys
        bindsym Left        resize shrink width 10 px or 10 ppt
        bindsym Down        resize grow height 10 px or 10 ppt
        bindsym Up          resize shrink height 10 px or 10 ppt
        bindsym Right       resize grow width 10 px or 10 ppt

        # back to normal: Enter or Escape or Mod4+r
        bindsym Return mode "default"
        bindsym Escape mode "default"
        bindsym Mod4+Tab mode "default"
}

bindsym Mod4+Tab mode "resize"

# Start i3bar to display a workspace bar (plus the system information i3status
# finds out, if available)
bar {
  status_command i3status
	position top
}

#######################################################################
# automatically start i3-config-wizard to offer the user to create a
# keysym-based config which used their favorite modifier (alt or windows)
#
# i3-config-wizard will not launch if there already is a config file
# in ~/.i3/config.
#
# Please remove the following exec line:
#######################################################################
exec i3-config-wizard

hide_edge_borders none
default_border pixel 4
force_display_urgency_hint 500 ms

bindsym Mod4+Mod1+x exec emacsclient -c
bindsym Mod4+Mod1+c exec chromium
bindsym Mod4+Mod1+z exec emacsclient -c ~/work/outreach/server/
bindsym Mod4+Mod1+f exec firefox
bindsym Mod4+Mod1+s exec signal-desktop


# Lock screen
bindsym Mod4+p exec i3lock -c 000000

# Pulse Audio controls
bindsym XF86AudioRaiseVolume exec pactl set-sink-volume @DEFAULT_SINK@ +2%; exec pactl set-sink-mute @DEFAULT_SINK@ 0
bindsym XF86AudioLowerVolume exec pactl set-sink-volume @DEFAULT_SINK@ -2%; exec pactl set-sink-mute @DEFAULT_SINK@ 0
bindsym XF86AudioMute exec pactl set-sink-mute @DEFAULT_SINK@ toggle

# Sreen brightness controls
#bindsym XF86MonBrightnessDown exec xbacklight -inc 20 # increase screen brightness
#bindsym XF86MonBrightnessUp exec xbacklight -dec 20 # decrease screen brightness