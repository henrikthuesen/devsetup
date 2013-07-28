# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="flazz"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git vi-mode)

source $ZSH/oh-my-zsh.sh

set -o vi
# allow comments on the prompt
setopt Interactivecomments

### Maven
# alias mvn3=~/tmp/apache-maven-3.0/bin/mvn

# color_maven3() {
#   mvn3 $* | colorMvn
# }

# alias mvn=color_maven3
# alias mvnt="color_maven3 -Dmaven.test.skip=true"
# export MAVEN_OPTS='-Xmx512M -XX:MaxPermSize=512M'
# CDPATH=".:~:modules:components"

# ### Java
# export JAVA_OPTS=-Xverify:none

export TERM=xterm-256color

export EDITOR=emacsclient

alias eclient='$EDITOR --no-wait'
alias e='emacs'

alias gd="git diff | look"
alias look="vim - +'setlocal nomodifiable' +'setlocal buftype=nofile' +'nmap q :q<CR>'"

# Wait for 1 second for the next key
KEYTIMEOUT=100

bindkey "^P" history-beginning-search-backward
bindkey "^N" history-beginning-search-forward
bindkey "^R" history-incremental-search-backward
bindkey ' ' magic-space
bindkey -s '^Gl' 'git slog\n'
bindkey -s '^Gb' 'git branch -a\n'
bindkey -s '^Gs' 'gss\n'
bindkey -s '^Gd' 'git diff --cached | look\n'
#bindkey -s '^Nc' 'mvnt clean package\n'
#bindkey -s '^Np' 'mvnt package\n'
#bindkey -s '^Nt' 'mvn -Phomeintegration test\n'
bindkey -s '^E' 'eclient '

unset LSCOLORS
# Don't give me that that 'nyae' shit
unsetopt correct_all

bindkey -M viins '' backward-delete-char
bindkey -M viins '' backward-delete-char
bindkey -M vicmd 'K' run-help

export PATH=$PATH:~/.cabal/bin

export PS1='%m%{${fg_bold[magenta]}%} :: %{$reset_color%}%{${fg[green]}%}${PWD/#$HOME/~} %{${fg_bold[$CARETCOLOR]}%}%#%{${reset_color}%} '

