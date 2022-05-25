#! /bin/sh

sudo -v
# Keep-alive: update existing sudo time stamp if set, otherwise do nothing.
while true; do
    sudo -n true
    sleep 60
    kill -0 "$$" || exit
done 2>/dev/null &

# xcode / homebrew
xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
eval $(/opt/homebrew/bin/brew shellenv)

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/agkozak/zsh-z $ZSH_CUSTOM/plugins/zsh-z

# gh
brew install gh
gh repo clone dotmac

# iterm2
brew tap homebrew/cask-versions
brew install iterm2-beta

# sublime-text
brew install --cask sublime-text
touch '/Users/natalia/Library/Application Support/Sublime Text/.Disable Safe Mode Shortcut'

# varied programs
brew install --cask 1password
brew install --cask 4k-video-downloader
brew install --cask alt-tab
brew install --cask bartender
brew install --cask beekeeper-studio
brew install --cask cleanshot
brew install --cask discord
brew install --cask docker
brew install --cask fig
brew install --cask firefox
brew install --cask forklift
brew install --cask google-drive
brew install --cask iina
brew install --cask imageoptim
brew install --cask insomnia
brew install --cask intellij-idea
brew install --cask kawa
brew install --cask microsoft-teams
brew install --cask ngrok
brew install --cask notion
brew install --cask qbittorrent
brew install --cask raycast
brew install --cask rectangle
brew install --cask scroll-reverser
brew install --cask slack
brew install --cask snipaste
brew install --cask telegram
brew install --cask visual-studio-code
brew install --cask whatsapp
brew install --cask zoom
brew install --cask zotero
brew install asdf
brew install bat
brew install exa
brew install fzf
brew install pipx
brew install rclone
brew install youtube-dl

# asdf
brew install asdf

# java
asdf plugin-add java
asdf list-all java
asdf install java openjdk-17.0.2
asdf global java openjdk-17.0.2

asdf plugin-add maven
asdf list-all maven
asdf install maven 3.8.5
asdf global maven 3.8.5

# nodejs
asdf plugin-add nodejs
asdf install nodejs lts
asdf global nodejs lts

npm install --global yarn
npm install --global @dotenv/cli
npm install --global clean-css-cli
npm install --global sync-dotenv
npm install --global @vue/cli
npm install --global @vue/cli-service-global

# python
asdf plugin-add python
asdf list-all python
asdf install python 3.10.4
asdf global python 3.10.4

brew install poetry
poetry config virtualenvs.in-project true


# AppStore
brew install mas
mas install 585829637   # Todoist
mas install 1507246666  # Presentify
mas install 1289583905  # Pixelmator Pro
mas install 1355679052  # Dropover
mas install 462054704   # Word
mas install 462058435   # Excel
mas install 462062816   # PowerPoint
mas install 411643860   # DaisyDisk
mas install 824183456   # Affinity Photo
mas install 824171161   # Affinity Designer
# mas install 1176895641  # Spark
# mas install 409203825   # Numbers
# mas install 409201541   # Pages
# mas install 409183694   # Keynote
# mas install 497799835   # XCode


# -> to repeat keypresses, but disables special keys on hold
defaults write -g ApplePressAndHoldEnabled -bool false

# brew install --cask sensiblesidebuttons // Instala versão intel :( -> https://github.com/thealpa/sensible-side-buttons/releases/tag/1.0.7
# epson -> https://epson.com.br/Suporte/Impressoras/Impressoras-multifuncionais/Epson-L/Epson-L395/s/SPT_C11CF46301?review-filter=macOS+12.x