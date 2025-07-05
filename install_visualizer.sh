#!/usr/bin/env bash
set -euo pipefail
ZIP_URL="https://github.com/YOUR_GITHUB_USER/visualizer/releases/latest/download/Visualizer.app.zip"
curl -L "$ZIP_URL" -o /tmp/Visualizer.app.zip
unzip -o -q /tmp/Visualizer.app.zip -d "$HOME/Applications"
APP="$HOME/Applications/Visualizer.app"
defaults read com.apple.dock persistent-apps | grep -q "$APP" || {
  defaults write com.apple.dock persistent-apps -array-add \
  "<dict><key>tile-data</key><dict><key>file-data</key><dict>
   <key>_CFURLString</key><string>file://${APP}</string>
   <key>_CFURLStringType</key><integer>15</integer>
   </dict></dict></dict>"; killall Dock ; }
echo "✅  Visualizer installed in ~/Applications."
