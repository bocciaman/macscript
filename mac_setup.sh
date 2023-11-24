#!/bin/bash
# This is a bash script for setting up a new Mac

# Show the Path Bar and Status Bar in Finder windows
echo "Configuring Finder..."
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true
killall Finder

# Update Mac software
echo "Updating Mac software..."
sudo softwareupdate -ia --verbose

# Check if Homebrew is installed, if not, install it
if ! which brew >/dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
else
    echo "Homebrew is already installed..."
fi

# Install Applications using Homebrew
apps=(
    alfred
    visual-studio-code
    1password
    textexpander
    keyboard-maestro
    hazel
    iterm2
)

echo "Installing applications..."
for app in ${apps[@]}; do
    brew install --cask $app
done

# Install Git
echo "Installing Git..."
brew install git

# Install Oh-my-zsh
echo "Installing Oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Powerline Fonts
echo "Installing Powerline Fonts..."
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

echo "Finder configuration, Mac software update, Homebrew installation/check, application installations, Oh-my-zsh and Powerline fonts installation completed."
