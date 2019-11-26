Checked the backlight directory: ls /sys/class/backlight. I happen to have intel_backlight.

To get the Identifier, I ran xrandr --verbose. Mine happened to be 0x72.

Checking /etc/X11/, I found no xorg.conf, so I made my own and entered the information I had found:

Section "Device"
    Identifier  "0x72"
    Driver      "intel"
    Option      "Backlight"  "intel_backlight"
EndSection

