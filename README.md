My sway rice. Nothing more

## Waybar

The config assumes you have `Fira Sans Nerd Font` installed

## Noctalia v5

The Sway config now starts Noctalia instead of Waybar. Install Noctalia on
Arch with `sudo pacman -S noctalia`, then link the tracked configuration:

```sh
ln -s /path/to/sway-rice/noctalia ~/.config/noctalia
```

The Noctalia bar mirrors the Waybar layout and Gruvbox palette. Its native
widgets provide the shell controls that matter most here:

- left-click volume for output devices and per-application streams; scroll to
  adjust by 2%; right-click to mute
- left-click brightness for monitor controls; scroll to adjust by 5%
- left-click Bluetooth for power, pairing, and connected-device controls;
  right-click to toggle the adapter

Weather needs a location/provider configured once in Noctalia Settings. The
old `fortune` quote, update count, and uptime modules are intentionally omitted:
Noctalia v5 has no equivalent script-output widget without a plugin. Network
shows NetworkManager VPNs natively; the old WireGuard script remains available
under `waybar/` for a Waybar rollback.

Validate the config before reloading Sway:

```sh
noctalia config validate ~/.config/noctalia
```
