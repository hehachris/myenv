#!/usr/bin/env bash

echo "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

echo "Installing Mac App Store cli..."
brew install mas

echo "Installing apps from Mac App Store..."
mas install \
  965442961 # Screenie

echo "Installing general Casks..."
brew install --cask \
    authy \
    evernote \
    firefox \
    google-chrome \
    itsycal \
    jordanbaird-ice \
    qblocker \
    scroll-reverser \
    Slack \
    spectacle \
    spotify

echo "Installing dev Casks..."
brew install --cask \
    github \
    phpstorm \
    postman \
    pycharm \
    tabtab \
    visual-studio-code
