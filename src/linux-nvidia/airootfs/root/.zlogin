# fix for screen readers
if grep -Fq 'accessibility=' /proc/cmdline &> /dev/null; then
    setopt SINGLE_LINE_ZLE
fi


if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
    exec startxfce4 &
    nvidia-settings -a "[gpu:0]/GPUFanControlState=1" -a "[fan:0]/GPUTargetFanSpeed=100" &
    xfconf-query -c xsettings -p "/Net/ThemeName" -t string -s "Arc-Lighter" &
    xfconf-query -c xsettings -p "/Net/IconThemeName" -t string -s "Papirus-Light" &
    xfconf-query -c xsettings -p "/Gtk/CursorThemeName" -t string -s "capitaine-cursors" &
    xfconf-query -c xsettings -p "/Gtk/FontName" -t string -s "Input Sans Condensed, Condensed 11" &
    xfconf-query -c xsettings -p "/Gtk/MonospaceFontName" -t string -s "Input Mono Narrow Semi-Condensed 11" &
    xfconf-query -c xfwm4 -p "/general/theme" -t string -s "Dots White" &
    xfconf-query -c xfwm4 -p "/general/title_font" -t string -s "Input Sans Compressed Extra-Condensed 11"
fi


