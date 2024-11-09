#!/bin/bash

# Adapted by Freddie for AllStarLink Version 3 on Debian 12
# Original Author: Tony Morris WRAW556 K1TNY for GMRS Live
# Date: 03/12/2023

# Usage: random.sh <directory> <node number> <play across all connected nodes flag (optional)>

# <directory> must only contain audio files compatible with Asterisk
# Node number refers to the AllStarLink node on which to play the audio
# The optional third argument (1) will play the audio across all connected nodes

# Example:
# random.sh /var/lib/asterisk/sounds/notices 1234 1

# Ensure script has execution permissions

FILES=($1/*)
RANDOM_INDEX=$(($RANDOM % ${#FILES[@]}))
SELECTED_FILE=${FILES[$RANDOM_INDEX]%.*}

# Check for third argument to determine play scope
if [ -z "$3" ]; then
    play_command="rpt localplay"
elif [ "$3" -eq 1 ]; then
    play_command="rpt playback"
fi

# Execute command through Asterisk
sudo asterisk -rx "$play_command $2 $SELECTED_FILE"
