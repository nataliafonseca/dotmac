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
brew install --cask notion
brew install --cask firefox
brew install --cask scroll-reverser
brew install --cask rectangle
brew install --cask visual-studio-code
brew install --cask raycast
brew install --cask google-drive
brew install --cask 4k-video-downloader
brew install --cask alt-tab
brew install --cask bartender
brew install --cask docker
brew install --cask github
brew install --cask iina
brew install --cask imageoptim
brew install --cask insomnia
brew install --cask beekeeper-studio
brew install --cask qbittorrent
brew install --cask snipaste
brew install --cask slack
brew install --cask discord
brew install --cask telegram
brew install --cask whatsapp
brew install --cask zotero
brew install --cask zoom
brew install --cask kawa
brew install --cask intellij-idea
brew install pipx
brew install bat
brew install exa
brew install rclone
brew install youtube-dl
brew install fzf

# java
brew install openjdk@11
sudo ln -sfn $(brew --prefix)/opt/openjdk@11/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-11.jdk

# python
brew install pyenv
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
pyenv install --list
pyenv install 3.10.2
pyenv global 3.10.2
brew install python-tk@3.10
brew install poetry
poetry config virtualenvs.in-project true

# node
brew install nvm
mkdir ~/.nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && \. "$(brew --prefix)/opt/nvm/nvm.sh"
[ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm"
nvm install 16
npm install --global yarn
npm install --global @dotenv/cli
npm install --global clean-css-cli
npm install --global sync-dotenv

# AppStore
brew install mas
mas install 1176895641  # Spark
mas install 585829637   # Todoist
mas install 1507246666  # Presentify
mas install 1289583905  # Pixelmator Pro
mas install 1355679052  # Dropover
mas install 1333542190  # 1password 7
mas install 462054704   # Word
mas install 462058435   # Excel
mas install 462062816   # PowerPoint
mas install 409203825   # Numbers
mas install 409201541   # Pages
mas install 409183694   # Keynote
mas install 497799835   # XCode
mas install 411643860   # DaisyDisk


# -> to repeat keypresses, but disables special keys on hold
defaults write -g ApplePressAndHoldEnabled -bool false

# brew install --cask sensiblesidebuttons // Instala versão intel :( -> https://github.com/thealpa/sensible-side-buttons/releases/tag/1.0.7
# epson -> https://epson.com.br/Suporte/Impressoras/Impressoras-multifuncionais/Epson-L/Epson-L395/s/SPT_C11CF46301?review-filter=macOS+12.x