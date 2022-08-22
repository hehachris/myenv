#!/usr/bin/env bash

GENERAL_CASKS="firefox franz google-chrome skype"
DEV_CASKS="github java phpstorm pycharm postman sublime-text visual-studio-code"

MY_CASKS="android-file-transfer authy bartender cloudapp evernote itsycal qblocker royal-tsx scroll-reverser spectacle spotify"

NORMAL=$(tput sgr0)
GREEN=$(tput setaf 2; tput bold)

ask() {
    name=$1
    read -p "${GREEN}Do you wish to install $name (y/N) ${NORMAL}" yn

    case $yn in
        [Yy]*) answer=true;;
        *) answer=false;;
    esac

    echo $answer
}

echo "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/chrislam/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

$(ask "general software ($GENERAL_CASKS)") \
    && brew install --cask $GENERAL_CASKS

$(ask "dev tools ($DEV_CASKS)") \
    && brew install --cask $DEV_CASKS

$(ask "my casks colletion ($MY_CASKS)") \
    && brew install --cask $MY_CASKS
