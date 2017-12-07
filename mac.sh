
#!/usr/bin/env bash

GENERAL_CASKS="firefox franz google-chrome skype"
DEV_CASKS="github java phpstorm pycharm sublime-text visual-studio-code"

MY_CASKS="android-file-transfer bartender cloudapp evernote itsycal qblocker royal-tsx scroll-reverser spectacle spotify"

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
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Installing Cask..."
brew tap caskroom/cask

$(ask "general software ($GENERAL_CASKS)") \
    && ln -s ~/Applications/Firefox.app /Applications/Firefox.app \
    && brew cask install $GENERAL_CASKS

$(ask "dev tools ($DEV_CASKS)") \
    && brew cask install $DEV_CASKS
    
$(ask "my casks colletion ($MY_CASKS)") \
    && brew cask install $MY_CASKS
