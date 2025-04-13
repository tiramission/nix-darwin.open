#!/usr/bin/env bash

# Restart script for SketchyBar

service_name="org.nix-community.home.sketchybar"
uid=$(id -u)
gui_service="gui/${uid}/${service_name}"
launchctl kickstart -k ${gui_service} 2>/dev/null || {
  echo "Failed to restart SketchyBar service: ${gui_service}"
  exit 1
}