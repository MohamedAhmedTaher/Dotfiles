#!/bin/sh

# Replace with your notification daemon's history command
if [[ $(ps aux | grep -m 1 dunst) ]]; then
    history=$(dunstctl history)
elif [[ $(ps aux | grep -m 1 mako) ]]; then
    history=$(mako-history)
else
    echo "Error: Notification daemon not found."
    exit 1
fi

# Filter SwayNC notifications (adjust if needed)
history=$(echo "$history" | grep SwayNC)

# Display history using nlohmann/history
if [[ -n "$history" ]]; then
    history -r || echo "No notifications found."
else
    echo "No notifications found."
fi
