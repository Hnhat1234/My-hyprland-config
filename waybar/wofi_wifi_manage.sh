export LC_ALL=en_US.UTF-8

LIST=$(nmcli --terse -g ssid device wifi list | grep -v '^$')
SSID_LIST=()

while IFS= read -r line; do 
    [ -n "$line" ] && SSID_LIST+=("$line")
done <<< "$LIST"

CONNECT_SSID(){
    local SSID=$1
    local PASSWORD=$2
    nmcli device wifi connect "$SSID" password "$PASSWORD"
}

case=$(wofi --show=dmenu <<< "$LIST" --style ~/.config/waybar/wofi.css --conf wofi.conf)

if [[ "$case" != "" ]]; then
    password=$(zenity --password)
    if [[ "$password" != "" ]]; then
        notify-send $(CONNECT_SSID "$case" "$password")
    else 
        echo ""
    fi
fi
