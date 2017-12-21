#!/usr/bin/env bash

CASKS="franz google-chrome"

echo "Installing Homebrew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Installing Homebrew Cask..."
brew tap caskroom/cask

echo "Installing Casks..."
brew cask install $CASKS
