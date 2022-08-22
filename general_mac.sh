#!/usr/bin/env bash

echo "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/chrislam/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

echo "Installing Mac App Store cli..."
brew install mas

echo "Installing Casks..."
brew cask install \
    bartender \
    franz \
    google-chrome \
    itsycal \
    qblocker \
    scroll-reverser \
    spectacle \
    spotify \
    visual-studio-code

mas signin chris@knetgb.com
mas install \
    982710545 # Forecast Bar
