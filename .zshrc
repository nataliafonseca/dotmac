# Fig pre block. Keep at the top of this file.
. "$HOME/.fig/shell/zshrc.pre.zsh"

# environment setup
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/Users/natalia/.local/bin
export PATH=$PATH:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin

## homebrew
eval $(/opt/homebrew/bin/brew shellenv)

## fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

## asdf
. /opt/homebrew/opt/asdf/libexec/asdf.sh
export ASDF_DATA_DIR=`brew --prefix asdf`
source $ASDF_DATA_DIR/asdf.sh

# oh-my-zsh configuration
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

zstyle ':omz:update' mode auto 
zstyle ':omz:update' frequency 180

plugins=(git
         gitfast
         copypath
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
alias ipy="ipython"
alias clone="gh repo clone"
alias dc="docker compose"
alias minifycss="cleancss -o style.min.css style.css --with-rebase"
alias dotenv="dotenv-cli"
alias create-next="yarn create next-app -e https://github.com/nataliafonseca/boilerplate_nextjs"
alias mirage-start="degit nataliafonseca/miragejs-starter-kit miragejs"
alias mkvenv="python -m venv ./.venv"
alias venv="source ./.venv/bin/activate"
alias poetryrm="rm -rf `poetry env info -p`"
alias speedtest="networkQuality"

## ssh connection to servers
alias homelab="ssh natalia@192.168.0.10"

## exa
which exa > /dev/null 2>&1 && alias ls="exa -lh --icons  --time-style=long-iso --group-directories-first --sort=name --sort=ext"
which exa > /dev/null 2>&1 && alias la="exa -lha --icons --time-style=long-iso --group-directories-first --sort=name --sort=ext"
which exa > /dev/null 2>&1 && alias tree="exa --icons --tree"

## docker
alias dprune="docker system prune --all --volumes"
alias postgres="docker compose -f /Users/natalia/.local/bin/postgres.yaml -p postgres"
alias mongo="docker compose -f /Users/natalia/.local/bin/mongo.yaml -p mongo"
alias redis="docker compose -f /Users/natalia/.local/bin/redis.yaml -p redis"
alias neo4j="docker compose -f /Users/natalia/.local/bin/neo4j.yaml -p neo4j"
alias cassandra="docker compose -f /Users/natalia/.local/bin/cassandra.yaml -p cassandra"

# docker exec
function dsh() {
  docker exec -it $1 sh
}

# npm audit fix for yarn projects
function yarn-audit-fix() {
  npm i --package-lock-only
  npm audit fix
  rm yarn.lock
  yarn import
  rm package-lock.json
}

# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/Users/natalia/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;

# Fig post block. Keep at the bottom of this file.
. "$HOME/.fig/shell/zshrc.post.zsh"
