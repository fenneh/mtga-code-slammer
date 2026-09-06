# mtga-code-slammer

[![ci](https://github.com/fenneh/mtga-code-slammer/actions/workflows/ci.yml/badge.svg)](https://github.com/fenneh/mtga-code-slammer/actions/workflows/ci.yml)
[![license](https://img.shields.io/github/license/fenneh/mtga-code-slammer)](LICENSE)

AutoHotkey script for bulk redeeming Magic: The Gathering Arena codes. Because entering 50 promo codes manually is nobody's idea of fun.

## Requirements

- [AutoHotkey v1](https://www.autohotkey.com/) - the script uses v1 syntax, not compatible with v2

## Usage

1. Edit `mtga-code-slammer.ahk` and add your codes to the `strings` array
2. Run the script
3. Open MTGA, go to Store, click the code redemption field
4. Press `Ctrl+J` to start

The script handles the clicking and typing. You handle the free cards.

Press `Ctrl+Escape` at any time to stop. The script also stops automatically if MTGA loses focus.

## Lazy option

Pre-compiled .exe in the repo if you don't want to install AutoHotkey. Note it may not include codes added after the last compile -- use the .ahk if you want everything.
