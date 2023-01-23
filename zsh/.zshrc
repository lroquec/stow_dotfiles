neofetch
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM="$ZSH_CONFIG/custom"
export DOTFILES="$HOME/.dotfiles"
export GIT_SSH_COMMAND="ssh -vvv -i ~/.ssh/github_key"

ZSH_THEME='kphoen'


###############
#  DIRCOLORS  #
###############

# eval dircolors
[[ -f "$HOME/.dircolors" ]] \
    && eval "$(dircolors "$HOME/.dircolors")"

plugins=(git z zsh-autosuggestions zsh-syntax-highlighting)

HISTCONTROL=ignoreboth
HISTTIMEFORMAT="%Y-%m-%d %T "

source $HOME/.bash_aliasses
source $HOME/.bash_functions

precmd() {
    source $HOME/.bash_aliasses
}

export VISUAL=vim
export EDITOR=vim
export PATH="$PATH:/usr/local/sbin:$DOTFILES/bin:$HOME/.local/bin"

ZSH_DISABLE_COMPFIX=true

#Autojump

if [ -f "/usr/share/autojump/autojump.sh" ]; then
	. /usr/share/autojump/autojump.sh
elif [ -f "/usr/share/autojump/autojump.bash" ]; then
	. /usr/share/autojump/autojump.bash
else
	echo "can't found the autojump script"
fi

source $ZSH/oh-my-zsh.sh