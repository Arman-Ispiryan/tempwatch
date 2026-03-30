# 🌡️ tempwatch

Live hardware temperature monitor for Linux — CPU cores, GPU, drives,
and a scrolling CPU usage graph. All in a clean terminal UI.

## Install
curl -fsSL https://armanispiryan.com/apt/install.sh | sudo bash

## Run
sudo tempwatch

## Keys
| Key | Action |
|-----|--------|
| Q / Esc | Quit |

Auto-refreshes every 2 seconds.

## Requirements
- lm-sensors (`sudo apt install lm-sensors && sudo sensors-detect --auto`)
- smartmontools (installed automatically)
- NVIDIA GPU: nvidia-smi for temp readings
