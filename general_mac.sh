#!/usr/bin/env bash

echo "Installing Homebrew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# echo "Installing Homebrew Cask..."
# brew tap caskroom/cask

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
