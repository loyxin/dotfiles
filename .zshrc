# If you come from bash you might have to change your $PATH.
source ~/.profile
[[ -d ~/.zplug ]] || git clone https://github.com/zplug/zplug ~/.zplug
source ~/.zplug/init.zsh
fpath=("$ZPLUG_HOME/bin" $fpath)

zplug "lib/clipboard", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]"
zplug "lib/completion", from:oh-my-zsh
zplug "lib/key-bindings", from:oh-my-zsh
zplug "lib/git", from:oh-my-zsh
zplug "lib/theme-and-appearance", from:oh-my-zsh
zplug "lib/directories", from:oh-my-zsh

zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "plugins/wd", from:oh-my-zsh
zplug "plugins/extract", from:oh-my-zsh
zplug "plugins/universalarchive", from:oh-my-zsh
zplug "plugins/rust", from:oh-my-zsh
zplug "plugins/fancy-ctrl-z", from:oh-my-zsh
zplug "plugins/copypath", from:oh-my-zsh
zplug "plugins/aliases", from:oh-my-zsh
zplug "plugins/safe-paste", from:oh-my-zsh

zplug "TheLocehiliosan/yadm", use:"completion/zsh/_yadm", as:command, defer:2
zplug "lukechilds/zsh-better-npm-completion", defer:2
zplug "zsh-users/zsh-completions"
zplug "jgogstad/passwordless-history"
zplug "djui/alias-tips"
zplug "brymck/print-alias"
zplug "b4b4r07/emoji-cli"
zplug "yuhunas/zsh-ansimotd"
zplug "mollifier/cd-gitroot", as:plugin, lazy:true
zplug "arzzen/calc.plugin.zsh"
# vi file:123
# zplug "nviennot/zsh-vim-plugin", defer:2
# zplug "jeffreytse/zsh-vi-mode", defer:2

zplug "zdharma-continuum/fast-syntax-highlighting"
# zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-autosuggestions"
zplug "k4rthik/git-cal", as:command, lazy:true
zplug "wfxr/forgit"
zplug "junegunn/fzf", use:"shell/*.zsh"
zplug "Aloxaf/fzf-tab"
# zplug "RobSis/zsh-completion-generator"

source ~/.workdiff/zshplugin.zsh
zplug load


DRACULA_DISPLAY_GIT=0
export FORGIT_PAGER="delta --features forgit -w ${FZF_PREVIEW_COLUMNS:-$COLUMNS}"
export FORGIT_DIFF_PAGER="delta --features forgit -w ${FZF_PREVIEW_COLUMNS:-$COLUMNS}"
export FZF_DEFAULT_COMMAND='fd --type f --color=never -E "node_modules"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--ansi --preview-window 'right:60%' --preview 'bat --color=always --style=header,grid --line-range :300 {} 2> /dev/null'"
export FZF_ALT_C_COMMAND="fd --type d --color=never"
export FZF_DEFAULT_OPTS="--border --info=inline"

PATH=~/program/install/bin:~/.cargo/bin:~/.local/bin:$PATH
VEHIST=10
HISTFILE=~/.zsh_history

export NPM_CONFIG_PREFIX=~/.npm-packages
PATH=$NPM_CONFIG_PREFIX/bin:$PATH
export NODE_PATH=$NPM_CONFIG_PREFIX/lib/node_modules:$NODE_PATH

export GOPATH=~/.gopkgi

export PATH
export LANG="en_US.UTF-8"
export EDITOR='vim'

export TLDR_LANGUAGE="zh"
export TLDR_CACHE_ENABLED=1
export TLDR_PAGES_SOURCE_LOCATION=~/.cache/tldr/page-source/pages

alias grep='grep --color=auto --exclude-dir={.git,.svn}'
alias wget='wget -c'
alias vi='vim'
alias ls='lsd'
alias l='ls -lFh'     #size,show type,human readable
alias la='ls -lAFh'   #long list,show almost all,show type,human readable
alias lr='ls -tRFh'   #sorted by date,recursive,show type,human readable
alias lt='ls -ltFh'   #long list,sorted by date,show type,human readable
alias ll='ls -l'      #long list
alias cp='cp -i'
alias mv='mv -i'
alias cat='coat'
alias df='duf'
alias vimswap='rm ~/.vim/bundle/files/swap/*.swp'
alias diff='batdiff --delta'
alias delta='delta --features loy'

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
alias vie="LOGVIM=1 vi"

## git-tab fzf
zstyle ':fzf-tab:*' fzf-min-height 10

# eval "$(atuin init zsh)"
eval "$(starship init zsh)"

# bindkey
compdef _vim vi

export LS_COLORS="$(vivid generate dracula)"

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"

# history duplicate
setopt EXTENDED_HISTORY # record timestamp
setopt HIST_EXPIRE_DUPS_FIRST # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_BEEP
setopt NOBEEP # Never beep
export HISTFILE="$HOME/.zsh_history"
export HISTSIZ=10000000
export SAVEHIST=10000000
