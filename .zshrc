# Set up the prompt

autoload -Uz promptinit
promptinit
prompt adam1 cyan cyan green

# Highlight the choice in suggestions
zstyle ':completion:*:default' menu select=1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 5000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

# Color for ls
export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
alias ls="ls -G"

# Show git branch
autoload -Uz vcs_info
# zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' formats '[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
RPROMPT="%1(v|%B%F{yellow}%1v%f%b|)"

# set terminal title including current directory
case "${TERM}" in
kterm*|xterm*)
esac

# (Common lines for git & terminal title)
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
    echo -ne "\033]0;${PWD}\007"
}


zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
# eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
#zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

cd ()
{
    builtin cd "$@" && ls
}

unpack() {
  if test -z "$1"; then
    echo "usage: $0 file [file...]" >/dev/stderr
    return 1
  fi

  while test -n "$1"; do
    case $1 in
      *.tar.gz | *.tgz) tar -zxvf $1 ;;
      *.tar.bz2 | *.tbz2) tar -jxvf $1 ;;
      *.tar) tar -xvf $1 ;;
      *.zip) unzip $1 ;;
      *.gz) gunzip $1 ;;
      *.bz2) bunzip2 $1 ;;
      *) echo "$0: unknown format: $1" >/dev/stderr ;;
    esac
    shift 1
  done
}

#aliases
alias sudo="sudo "
alias mk="make"
alias mw="make write"
alias mc="make clean"
alias javac="javac -J-Dfile.encoding=UTF8"
alias subl="open -a /Applications/Sublime\ Text.app"
alias wine="cd /usr/local/wine/bin/ "
alias wineexec="/usr/local/wine/bin/wine explorer"
alias wineboot="/usr/local/wine/bin/wineboot"
alias winetricks="/usr/local/wine/bin/winetricks"
alias winecfg="/usr/local/wine/bin/winecfg"
alias grep="grep --color=auto "
alias ks="ls "
alias ll="ls -l "
alias phpmyadmin="cd /opt/local/www/phpmyadmin/"
alias serialload='sudo kextload /System/Library/Extensions/IOUSBFamily.kext/Contents/PlugIns/AppleUSBFTDI.kext'
alias serialunload='sudo kextunload /System/Library/Extensions/IOUSBFamily.kext/Contents/PlugIns/AppleUSBFTDI.kext'
alias minicom='serialunload; serialload; LANG=C sudo minicom '
alias serialmw='serialunload; mw; serialload '
# alias mysql="/opt/local/lib/mysql56/bin/mysql "
# alias mysqladmin="/opt/local/lib/mysql56/bin/mysqladmin "
# alias port="/opt/local/bin/port"
# source ~/ros/setup.zsh
source ~/.zprofile