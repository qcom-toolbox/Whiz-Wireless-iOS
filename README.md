<p align="center">
  <img src="ICON.png" width="120" alt="Whiz Wireless icon">
</p>

<h1 align="center">Whiz Wireless</h1>

<p align="center">Cosmetic status bar override for iOS 15 rootless jailbreaks.</p>

<p align="center">
  <img src="demo.gif" width="240" alt="Whiz Wireless demo">
</p>

## What it does

Replaces the status bar's cellular text (e.g. "No SIM") with a custom carrier
string, by hooking `_UIStatusBarDataCellularEntry setString:` in SpringBoard.
A Preferences bundle is included for future configuration.

## Requirements

- iOS 15.x, rootless jailbreak (tested on Dopamine)
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
