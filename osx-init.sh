#!/bin/bash

defaults write com.apple.dock persistent-apps -array # remove icons in Dock
defaults write com.apple.dock autohide -bool true    # turn Dock auto-hidng on
defaults write com.apple.dock orientation left       # place Dock on the left side of screen

killall Dock 2>/dev/null

# install command line tools
touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress

clt_label_command="/usr/sbin/softwareupdate -l |
                      grep -B 1 -E 'Command Line Tools' |
                      awk -F'*' '/^ *\\*/ {print \$2}' |
                      sed -e 's/^ *Label: //' -e 's/^ *//' |
                      sort -V |
                      tail -n1"

clt_label=$(/bin/bash -c ${clt_label_command})

softwareupdate -i ${clt_label} --verbose

rm /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress
