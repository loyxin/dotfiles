# If you come from bash you might have to change your $PATH.
source ~/.profile
[[ -d ~/.zplug ]] || git clone https://github.com/zplug/zplug ~/.zplug
source ~/.zplug/init.zsh

zplug "lib/clipboard", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]"
zplug "lib/completion", from:oh-my-zsh
zplug "lib/history", from:oh-my-zsh
zplug "lib/key-bindings", from:oh-my-zsh
zplug "lib/git", from:oh-my-zsh
zplug "lib/theme-and-appearance", from:oh-my-zsh
zplug "lib/directories", from:oh-my-zsh

zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "plugins/wd", from:oh-my-zsh
zplug "plugins/extract", from:oh-my-zsh
zplug "plugins/universalarchive", from:oh-my-zsh
zplug "plugins/rust", from:oh-my-zsh
zplug "plugins/vi-mode", from:oh-my-zsh
zplug "plugins/fancy-ctrl-z", from:oh-my-zsh
zplug "plugins/catimg", from:oh-my-zsh
zplug "plugins/copypath", from:oh-my-zsh
zplug "plugins/timer", from:oh-my-zsh
zplug "plugins/ripgrep", from:oh-my-zsh
zplug "plugins/fd", from:oh-my-zsh
zplug "plugins/aliases", from:oh-my-zsh
zplug "plugins/safe-paste", from:oh-my-zsh

source ~/.workdiff/zshplugin.zsh

DRACULA_DISPLAY_GIT=0
FORGIT_DIFF_PAGER="delta --features forgit"
FORGIT_PAGER="delta --features forgit"
FORGIT_SHOW_PAGER="delta --features forgit"

zplug load

PATH=~/bin:~/.local/bin:~/program/install/bin:~/.cargo/bin:/usr/local/bin:$PATH

export PATH
export LANG="en_US.UTF-8"
export GIT_SSL_NO_VERIFY=1
export FZF_DEFAULT_COMMAND='fd --type f --color=never -E "node_modules"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type d --color=never"
export FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --preview 'bat --color=always --style=header,grid --line-range :300 {} 2> /dev/null'"
export BAT_THEME=Dracula
export EDITOR='vim'

export MCFLY_KEY_SCHEME=vim
export MCFLY_INTERFACE_VIEW=BOTTOM
eval "$(mcfly init zsh)"

alias grep='grep --color=auto --exclude-dir={.git,.svn}'
alias wget='wget -c'
alias vi='vim'
alias ls='lsd'
alias l='ls -lFh'     #size,show type,human readable
alias la='ls -lAFh'   #long list,show almost all,show type,human readable
alias lr='ls -tRFh'   #sorted by date,recursive,show type,human readable
alias lt='ls -ltFh'   #long list,sorted by date,show type,human readable
alias ll='ls -l'      #long list
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias cat='coat'
alias df='duf'

function _get_git_branch() {
    local _head_file _head
    local _dir="$PWD"

    while [[ -n "$_dir" ]]; do
        _head_file="$_dir/.git/HEAD"
        if [[ -f "$_dir/.git" ]]; then
            read -r _head_file < "$_dir/.git" && _head_file="$_dir/${_head_file#gitdir: }/HEAD"
        fi
        [[ -e "$_head_file" ]] && break
        _dir="${_dir%/*}"
    done

    if [[ -e "$_head_file" ]]; then
        read -r _head < "$_head_file" || return
        case "$_head" in
            ref:*) printf "${_head#ref: refs/heads/}" ;;
            "") ;;
            # HEAD detached
            *) printf "${_head:0:9}" ;;
        esac
        return 0
    fi

    return 1
}

alias gb="_get_git_branch && echo "
alias cdu='cd-gitroot'
