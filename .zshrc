LOCAL_ZSH=/usr/local/bin/zsh
test -x $LOCAL_ZSH -a ! /proc/$$/exe -ef $LOCAL_ZSH && exec $LOCAL_ZSH

alias be="bundle exec"
alias bs="bundle exec rspec"
alias bc="bundle exec rails console"

alias cdc="cd ~/work/causes"

alias ssh="TERM=screen ssh"

autoload -U colors && colors

autoload -Uz vcs_info
FMT_BRANCH="[%b] "
zstyle ':vcs_info:*:prompt:*' actionformats "${FMT_BRANCH}(%a) "
zstyle ':vcs_info:*:prompt:*' formats       "${FMT_BRANCH}"
function precmd {
    vcs_info 'prompt'
}

setopt PROMPT_SUBST
setopt histignorespace

PROMPT=$'%{\e[0;32m%}%n%{\e[0;31m%}@%{\e[0;34m%}%m%%%{\e[0m%} '
RPROMPT='%{$fg[yellow]%}${vcs_info_msg_0_}%{$fg[red]%}%~%{${reset_color}%}'

export EDITOR="vim"
export CLICOLOR=1       # some shells need this to enable colorized out
export GREP_COLOR=32    # some greps have colorized ouput. enable...
export GREPCOLOR=32     # dito here
export PATH=~/bin:$PATH

alias vi='vim'
alias ls='ls -F --color=auto'
alias -g '...'='../..'
alias -g '....'='../../..'
alias -g '.....'='../../../..'


#ve zkbd determine your keymaps

bindkey -e

autoload zkbd
[[ ! -f ~/.zkbd/$TERM-$VENDOR-$OSTYPE ]] #&& zkbd
source ~/.zkbd/$TERM-$VENDOR-$OSTYPE

## bind the keys that zkbd set up to some widgets

[[ -n ${key[Backspace]} ]] && bindkey "${key[Backspace]}" backward-delete-char
[[ -n ${key[Home]} ]] && bindkey "${key[Home]}" beginning-of-line
[[ -n ${key[PageUp]} ]] && bindkey "${key[PageUp]}" up-line-or-history
[[ -n ${key[Delete]} ]] && bindkey "${key[Delete]}" delete-char
[[ -n ${key[End]} ]] && bindkey "${key[End]}" end-of-line
[[ -n ${key[PageDown]} ]] && bindkey "${key[PageDown]}" down-line-or-history
[[ -n ${key[Up]} ]] && bindkey "${key[Up]}" up-line-or-search
[[ -n ${key[Left]} ]] && bindkey "${key[Left]}" backward-char
[[ -n ${key[Down]} ]] && bindkey "${key[Down]}" down-line-or-search
[[ -n ${key[Right]} ]] && bindkey "${key[Right]}" forward-char

# The following lines were added by compinstall

zstyle ':completion:*' completer _complete
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}'
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' squeeze-slashes true
zstyle :compinstall filename '/home/lann/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob
unsetopt beep
unsetopt nomatch
# End of lines configured by zsh-newuser-install

