#!/bin/sh

interface="wg0"
config="/etc/wireguard/wg0.conf"

is_connected() {
    ip link show dev "$interface" >/dev/null 2>&1
}

show_status() {
    if is_connected; then
        printf '%s\n' '{"text":"󰖂 VPN On","tooltip":"wg0 is connected\nClick to disconnect","class":"connected"}'
    else
        printf '%s\n' '{"text":"󰖂 VPN Off","tooltip":"wg0 is disconnected\nClick to connect","class":"disconnected"}'
    fi
}

toggle() {
    if is_connected; then
        action="down"
        target="$interface"
    else
        action="up"
        target="$config"
    fi

    foot --title="WireGuard $interface" sh -c '
        sudo wg-quick "$1" "$2"
        result=$?
        if [ "$result" -ne 0 ]; then
            printf "\nWireGuard command failed. Press Enter to close."
            read -r _
        fi
        exit "$result"
    ' sh "$action" "$target"
    pkill -RTMIN+9 waybar 2>/dev/null || true
}

case "${1:-status}" in
    status) show_status ;;
    toggle) toggle ;;
    *)
        printf 'Usage: %s [status|toggle]\n' "$0" >&2
        exit 2
        ;;
esac
