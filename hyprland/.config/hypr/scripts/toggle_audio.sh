#!/bin/bash

# Regex patterns to extract IDs
SPEAKER_REGEX='(\d+)\.\sUSB Audio Speakers'
HEADSET_REGEX='(\d+)\.\sHyperX Cloud Alpha Wireless Analog Stereo'

# Extract IDs (take only the first match in case the name appears twice)
SPEAKER_ID=$(wpctl status | grep -Po "$SPEAKER_REGEX" | grep -Po '^\d+' | head -n1)
HEADSET_ID=$(wpctl status | grep -Po "$HEADSET_REGEX" | grep -Po '^\d+' | head -n1)

echo "$SPEAKER_ID"
echo "$HEADSET_ID"

# Get current default sink ID from wpctl inspect (handles "id 45, type ..." format)
DEFAULT_ID=$(wpctl inspect @DEFAULT_AUDIO_SINK@ | grep -Po '^id\s+\K\d+')

# Safety check
if [[ -z "$SPEAKER_ID" || -z "$HEADSET_ID" ]]; then
    notify-send "❌ Audio Toggle" "Couldn't find speaker or headset IDs."
    exit 1
fi

# Toggle
if [[ "$DEFAULT_ID" == "$HEADSET_ID" ]]; then
    wpctl set-default "$SPEAKER_ID"
    notify-send "🔊 Audio Output" "Switched to Speakers"
else
    wpctl set-default "$HEADSET_ID"
    notify-send "🎧 Audio Output" "Switched to Headset"
fi
