#!/bin/bash

if [[ $1 != "-f" ]]; then
  echo "this script will delete your ~/.config/nvim directory"
  echo "run this again with -f if you're cool with that"
  exit 1
fi

echo "installing nvim config"

if [[ -d "$HOME/.config/nvim/plugin" ]]; then
  echo "...compiled plugins detected"
  mv ~/.config/nvim/plugin ~/.config/nvim_plugin
fi

rm -rf ~/.config/nvim
mkdir -p ~/.config
cp -r nvim ~/.config/

if [[ -d "$HOME/.config/nvim_plugin" ]]; then
  echo "...restoring plugins"
  mv ~/.config/nvim_plugin ~/.config/nvim/plugin
fi
