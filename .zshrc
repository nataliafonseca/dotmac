
#### FIG ENV VARIABLES ####
# Please make sure this block is at the start of this file.
[ -s ~/.fig/shell/pre.sh ] && source ~/.fig/shell/pre.sh
#### END FIG ENV VARIABLES ####





# enviroment setup
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/Users/natalia/.local/bin

## homebrew
eval $(/opt/homebrew/bin/brew shellenv)

## nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && \. "$(brew --prefix)/opt/nvm/nvm.sh" # This loads nvm
[ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

## pyenv
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

## react native
export REACT_EDITOR=code
export JAVA_HOME=/opt/homebrew/Cellar/openjdk/17.0.2/libexec/openjdk.jdk/Contents/Home
export ANDROID_HOME=/Users/natalia/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools


# oh-my-zsh configuration
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="spaceship"
zstyle ':omz:update' mode auto 
zstyle ':omz:update' frequency 180
plugins=(git
         copypath
         docker
         docker-compose
         zsh-z
         zsh-autosuggestions
         zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

## spaceship theme configuration
SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  hg            # Mercurial section (hg_branch  + hg_status)
  exec_time     # Execution time
  line_sep      # Line break
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)
SPACESHIP_USER_SHOW=always
SPACESHIP_PROMPT_ADD_NEWLINE=true
SPACESHIP_CHAR_SYMBOL="❯"
SPACESHIP_CHAR_SUFFIX=" "


# aliases and functions
alias refresh="exec $SHELL"
alias clr="clear"
alias copydir="copypath"

## dotfiles git management
alias gdot="git --git-dir=.dot"
alias updots="gdot add -u; gdot commit -m 'update dotfiles'; gdot push"

## general
alias py="python"
alias clone="gh repo clone"
alias dc="docker-compose"
alias minifycss="cleancss -o style.min.css style.css --with-rebase"
alias dotenv="dotenv-cli"
alias create-next="yarn create next-app -e https://github.com/nataliafonseca/boilerplate_nextjs"
alias mirage-start="degit nataliafonseca/miragejs-starter-kit miragejs"
alias mkvenv="python -m venv ./venv"
alias venv="source ./venv/bin/activate"
alias poetryrm="rm -rf `poetry env info -p`"

## ssh connection to servers
alias homelab="ssh natalia@192.168.0.10"
alias cloudserver="ssh natalia@static.151.42.161.5.clients.your-server.de"

## exa
which exa > /dev/null 2>&1 && alias ls="exa -lh --time-style=long-iso --group-directories-first --sort=name --sort=ext"
which exa > /dev/null 2>&1 && alias la="exa -lha --time-style=long-iso --group-directories-first --sort=name --sort=ext"
which exa > /dev/null 2>&1 && alias tree="exa --tree"

## docker images
alias dprune="docker system prune --all --volumes"
alias postgres="docker-compose -f postgres.yaml"
alias mongo="docker-compose -f mongo.yaml"
alias redis="docker-compose -f redis.yaml"

# npm audit fix for yarn projects
function yarn-audit-fix() {
  npm i --package-lock-only
  npm audit fix
  rm yarn.lock
  yarn import
  rm package-lock.json
}





#### FIG ENV VARIABLES ####
# Please make sure this block is at the end of this file.
[ -s ~/.fig/fig.sh ] && source ~/.fig/fig.sh
#### END FIG ENV VARIABLES ####
