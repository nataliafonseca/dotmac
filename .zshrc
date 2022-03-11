# environment setup
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/Users/natalia/.local/bin

## antlr
export CLASSPATH=".:/Users/natalia/.antlr/antlr-4.9.2-complete.jar:$CLASSPATH"
alias antlr4='java -jar /Users/natalia/.antlr/antlr-4.9.2-complete.jar'
alias grun='java org.antlr.v4.gui.TestRig'

## homebrew
eval $(/opt/homebrew/bin/brew shellenv)

## fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

## nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && \. "$(brew --prefix)/opt/nvm/nvm.sh" # This loads nvm
[ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

## pyenv
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

## java
export PATH="/opt/homebrew/opt/openjdk@11/bin:$PATH"
export CPPFLAGS="-I/opt/homebrew/opt/openjdk@11/include"

## rust/cargo
export PATH="/Users/natalia/.cargo/bin:$PATH"

## react native
export REACT_EDITOR=code
export JAVA_HOME=/opt/homebrew/Cellar/openjdk@11/11.0.12/libexec/openjdk.jdk/Contents/Home
export ANDROID_HOME=/Users/natalia/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

## dotnet
export DOTNET_ROOT="$(brew --prefix)/opt/dotnet/libexec"

# oh-my-zsh configuration
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

zstyle ':omz:update' mode auto 
zstyle ':omz:update' frequency 180

plugins=(git
         gitfast
         copypath
         dotenv
         zsh-interactive-cd
         zsh-z
         zsh-autosuggestions
         zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

## powerlevel10k theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# aliases and functions
## shell functions
alias refresh="exec $SHELL"
alias clr="clear"
alias copydir="copypath"

## dotfiles git management
alias gdot="git --git-dir=.dot"
alias updots="gdot add -u; gdot commit -m 'update dotfiles'; gdot push"

## general
alias py="python"
alias clone="gh repo clone"
alias dc="docker compose"
alias minifycss="cleancss -o style.min.css style.css --with-rebase"
alias dotenv="dotenv-cli"
alias create-next="yarn create next-app -e https://github.com/nataliafonseca/boilerplate_nextjs"
alias mirage-start="degit nataliafonseca/miragejs-starter-kit miragejs"
alias mkvenv="python -m venv ./.venv"
alias venv="source ./.venv/bin/activate"
alias poetryrm="rm -rf `poetry env info -p`"

## ssh connection to servers
alias homelab="ssh natalia@192.168.0.10"
alias cloudserver="ssh natalia@static.151.42.161.5.clients.your-server.de"

## exa
which exa > /dev/null 2>&1 && alias ls="exa -lh --icons  --time-style=long-iso --group-directories-first --sort=name --sort=ext"
which exa > /dev/null 2>&1 && alias la="exa -lha --icons --time-style=long-iso --group-directories-first --sort=name --sort=ext"
which exa > /dev/null 2>&1 && alias tree="exa --icons --tree"

## docker images
alias dprune="docker system prune --all --volumes"
alias postgres="docker compose -f /Users/natalia/.local/bin/postgres.yaml -p postgres"
alias mongo="docker compose -f /Users/natalia/.local/bin/mongo.yaml -p mongo"
alias redis="docker compose -f /Users/natalia/.local/bin/redis.yaml -p redis"

# npm audit fix for yarn projects
function yarn-audit-fix() {
  npm i --package-lock-only
  npm audit fix
  rm yarn.lock
  yarn import
  rm package-lock.json
}
