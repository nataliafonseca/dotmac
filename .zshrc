
#### FIG ENV VARIABLES ####
# Please make sure this block is at the start of this file.
[ -s ~/.fig/shell/pre.sh ] && source ~/.fig/shell/pre.sh
#### END FIG ENV VARIABLES ####
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 180

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git
         copypath
         zsh-z
         zsh-autosuggestions
         zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH=$PATH:/usr/local/bin
export PATH=$PATH:/Users/natalia/.local/bin

alias refresh="exec $SHELL"
alias refresh="exec $SHELL"
alias refresf="exec $SHELL"
alias clr="clear"
alias amend="git commit --amend --no-edit"
alias nothankyouadobe="sudo -H killall ACCFinderSync AGMService \"Core Sync\" AdobeCRDaemon \"Adobe Creative\" AdobeIPCBroker node \"Adobe Desktop Service\" \"Adobe Crash Reporter\";sudo -H rm -rf \"/Library/LaunchAgents/com.adobe.AAM.Updater-1.0.plist\" \"/Library/LaunchAgents/com.adobe.AdobeCreativeCloud.plist\" \"/Library/LaunchDaemons/com.adobe.*.plist\""
alias homelab="ssh natalia@192.168.0.10"
alias cloudserver="ssh natalia@static.151.42.161.5.clients.your-server.de"
alias updots="git --git-dir=.dot pull; git --git-dir=.dot add -u; git --git-dir=.dot commit -m 'update dotfiles'; git --git-dir=.dot push"
alias updot="updots"
alias venv="source ./venv/bin/activate"
alias gdot="git --git-dir=.dot"
alias create-next="yarn create next-app -e https://github.com/nataliafonseca/boilerplate_nextjs"
alias mirage-start="degit nataliafonseca/miragejs-starter-kit miragejs"
alias py="python"
alias copydir="copypath"
which docker-compose > /dev/null 2>&1 && alias dc="docker-compose"
which cleancss > /dev/null 2>&1 && alias minifycss="cleancss -o style.min.css style.css --with-rebase"
which dotenv-cli > /dev/null 2>&1 && alias dotenv="dotenv-cli"
which exa > /dev/null 2>&1 && alias ls="exa -lh --time-style=long-iso --group-directories-first --sort=name --sort=ext"
which exa > /dev/null 2>&1 && alias la="exa -lha --time-style=long-iso --group-directories-first --sort=name --sort=ext"
which exa > /dev/null 2>&1 && alias tree="exa --tree"
# which bat > /dev/null 2>&1 && alias cat="bat"
which gh > /dev/null 2>&1 && alias clone="gh repo clone"

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
eval "$(pyenv init -)"
