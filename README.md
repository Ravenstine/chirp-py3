chirp-py3 homebrew formula
==========================

This [Homebrew](https://brew.sh) formula will allow you to install and use the [CHIRP](https://chirp.danplanet.com) with Python 3 and GTK+3.

Although the official daily build for CHIRP does work on macOS, for a variety of reasons, I don't want to be using Python 2 or outdated dependencies.

This formula works by pulling the "py3" development branch, converting the syntax to Python 3, and applying some patches to fix a few things.  It will make the app's scripts available in your `PATH`, but an application bundle will not be generated because I just don't care about doing that.

Some things will probably be broken, especially drivers.  I made this formula for myself and am sharing it in case you find it useful.  It is not a replacement for the official builds, and it may become totally unnecessary when the official builds have migrated to Python 3 and WXWidgets.


## Installation

```sh
brew install --formula https://github.com/ravenstine/chirp-py3-mac/chirp-py3-mac.rb
```

## Install Latest HEAD

```sh
brew install --formula --HEAD https://github.com/ravenstine/chirp-py3-mac/chirp-py3-mac.rb
```

## Uninstallation

```sh
brew uninstall chirp-py3-mac
```
