<p align="center">
  <img src="ICON.png" width="120" alt="Whiz Wireless icon">
</p>

<h1 align="center">Whiz Wireless</h1>

<p align="center">Cosmetic status bar override for iOS 15 rootless jailbreaks.</p>

<p align="center">
  <img src="demo.gif" width="240" alt="Whiz Wireless demo">
</p>

## What it does

- **Carrier name:** replaces the status bar's cellular text (e.g. "No SIM")
  with a custom string, by hooking `_UIStatusBarDataCellularEntry setString:`
  in SpringBoard.
- **Signal bars:** optionally forces the cellular signal icon to show a fixed
  number of bars (0–4), by hooking `_UIStatusBarSignalView`. The Wi-Fi icon is
  left alone.

## Settings

Everything is configured from **Settings → Whiz Wireless**:

| Setting      | Description                                             | Default            |
|--------------|---------------------------------------------------------|--------------------|
| Carrier Name | Text shown in place of the cellular status text        | `Whiz Wireless 9G` |
| Signal Bars  | `Off` keeps the real signal, or pick 0–4 bars           | `Off`              |
| Respring     | Restarts SpringBoard so changes take effect             |                    |

Changes apply after a respring.

## Requirements

- iOS 15.x, rootless jailbreak (tested on Dopamine, iPhone XS, iOS 15.4.1)
- Theos

## Building

```bash
export THEOS=/path/to/theos
make package FINALPACKAGE=1
```

This produces a `.deb` under `packages/`.

## Installing

Copy the `.deb` to the device and install it with Sileo/Zebra, or over SSH:

```bash
dpkg -i qcom-toolbox.whiz-wireless_*.deb
killall -9 SpringBoard
```

## License

BSD 2-Clause. See [LICENSE](LICENSE).
