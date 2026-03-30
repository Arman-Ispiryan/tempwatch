#!/bin/bash
REPO_URL="https://armanispiryan.com/apt"
LIST_FILE="/etc/apt/sources.list.d/discdiag.list"

if [ "$EUID" -ne 0 ]; then
    echo "Please run as root (sudo bash install.sh)"
    exit 1
fi

echo "[tempwatch] Adding apt repository..."
echo "deb [trusted=yes] ${REPO_URL} ./" > "$LIST_FILE"
echo "[tempwatch] Updating package lists..."
apt-get update -qq
echo "[tempwatch] Installing tempwatch..."
apt-get install -y tempwatch
echo ""
echo "✔  tempwatch installed! Run: sudo tempwatch"
