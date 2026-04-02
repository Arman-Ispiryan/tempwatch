# 🌡️ Tempwatch

> Live hardware temperature monitor for Linux

tempwatch is a real-time terminal UI that displays CPU core temperatures, GPU temperature, drive temperatures, and a live scrolling CPU usage graph, all colour-coded and auto-refreshing every 2 seconds.

![Platform](https://img.shields.io/badge/platform-Linux-blue)
![Python](https://img.shields.io/badge/python-3.8%2B-blue)
![License](https://img.shields.io/badge/license-MIT-green)
![Version](https://img.shields.io/badge/version-1.0.0-brightgreen)

---

## Preview

```
──────────────────────  ⬡  tempwatch  v1.0.0  ⬡  ──────────────  12:34:56  ──
┌──────────────────── CPU  ·  Intel Core i5-9600K @ 3.70GHz ───────────────┐
│ Core 0    ████░░░░  38.0°C    Core 1    ██░░░░░░  32.0°C                 │
│ Core 2    ███░░░░░  35.0°C    Core 3    ████░░░░  39.0°C                 │
│ Core 4    ██░░░░░░  33.0°C    Core 5    ███░░░░░  36.0°C                 │
└──────────────────────────────────────────────────────────────────────────┘

┌─── GPU ───────────────────────┐  ┌─── Drives ────────────────────────────┐
│ NVIDIA GeForce RTX 3090       │  │ /dev/sda   WDC WD120EMFZ      27.0°C  │
│ ████░░░░░░  45.0°C            │  │ /dev/sdb   Samsung SSD 870    31.0°C  │
└───────────────────────────────┘  └───────────────────────────────────────┘

┌──────────────────────────── CPU Usage ──────────────────────────── 23.4%─┐
│100│                                                                      │
│ 75│                  ██                                                  │
│ 50│        ████  ████████  ████                      ████                │
│ 25│▄▄██████████████████████████████████████████████████████████████▄▄▄▄▄ │
│  0│····································································· │
└──────────────────────────────────────────────────────────────────────────┘
──────────────────────── Q Quit  ·  Auto-refresh every 2s ──────────────────
```

---

## Features

- Per-core CPU temperature with colour-coded fill bars
- GPU temperature — supports NVIDIA (via `nvidia-smi`) and AMD (via `amdgpu` sensor)
- Drive temperatures for all physical disks via SMART data
- Live scrolling CPU usage graph with 120-sample history
- Colour thresholds — green under 50°C, yellow 50–70°C, red above 70°C
- Zero interaction required — just run it and watch
- Lightweight — pure Python, no heavy dependencies

---

## Install

### Quick install (recommended)

```bash
curl -fsSL https://armanispiryan.com/apt/install-tempwatch.sh | sudo bash
```

Adds the apt repository and installs tempwatch. Future updates come through `sudo apt upgrade`.

### Manual apt setup

```bash
echo "deb [trusted=yes] https://armanispiryan.com/apt ./" | sudo tee /etc/apt/sources.list.d/armanispiryan.list
sudo apt update
sudo apt install tempwatch
```

### Direct .deb download

Download the latest `.deb` from [Releases](../../releases) and install:

```bash
sudo dpkg -i tempwatch_1.0.0_all.deb
sudo apt install -f
```

---

## Usage

```bash
sudo tempwatch
```

Root is required to read drive temperatures via SMART.

### Keys

| Key | Action |
|-----|--------|
| `Q` / `Esc` | Quit |

Everything else is automatic — tempwatch refreshes every 2 seconds with no input needed.

---

## Requirements

- Linux (Ubuntu, Debian, and derivatives)
- Python 3.8+
- `lm-sensors` — for CPU and GPU temperatures
- `smartmontools` — for drive temperatures (installed automatically)
- `nvidia-smi` — optional, for NVIDIA GPU temperatures

### First time setup

If you haven't used `lm-sensors` before, run the auto-detection once after installing:

```bash
sudo apt install lm-sensors
sudo sensors-detect --auto
```

This detects your hardware sensors and makes them available to tempwatch.

---

## Temperature Thresholds

| Range | Colour | Status |
|-------|--------|--------|
| < 50°C | 🟢 Green | Normal |
| 50°C – 70°C | 🟡 Yellow | Warm |
| > 70°C | 🔴 Red | Hot |

---

## How it works

tempwatch reads CPU core temperatures from `lm-sensors` (`sensors -j`), GPU temperatures from either `lm-sensors` (AMD) or `nvidia-smi` (NVIDIA), and drive temperatures from `smartctl`. CPU usage is calculated by reading `/proc/stat` directly — no extra dependencies needed. The graph maintains a 120-sample rolling history. The entire UI is built with Python's built-in `curses` module.

---

## Building from source

```bash
git clone https://github.com/Arman-Ispiryan/tempwatch.git
cd tempwatch
chmod +x build_deb.sh
./build_deb.sh
sudo dpkg -i tempwatch_1.0.0_all.deb
```

---

## Related

- [discdiag](https://github.com/Arman-Ispiryan/discdiag) — Interactive disk health diagnostic tool

---

## License

MIT — do whatever you want with it.
