#!/bin/bash

# Mute the mic on startup.
amixer set Capture nocap

# Disable repeating on the space key.
xset -r 65

# Start the listener.
sxhkd
