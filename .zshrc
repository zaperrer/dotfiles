# ================= Aliases =================
alias_path="${HOME}/.zsh_aliases"
[[ -f "$alias_path" ]] && source "$alias_path"
export PATH="$HOME/bin/$:$PATH" # Load stowed binaries
zoxide-init() {eval "$(zoxide init --cmd cd zsh)"}

# # ================= Pyenv =================
export PYENV_ROOT="$HOME/.pyenv"
if [[ -d $PYENV_ROOT/bin ]] then
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# # ================= Warp Skip =================
term=$(ps -p $(ps -p $$ -o ppid=) -o args=)
if [[ $term =~ 'Warp' ]]
then
    if ! command -v zoxide &> /dev/null
        zoxide-init
    fi
    return 0
fi

# ================= Plugins =================
export ZPLUG_HOME=$HOME/.zplug
[[ -d "${ZPLUG_HOME}" ]] || git clone https://github.com/zplug/zplug $ZPLUG_HOME
source $ZPLUG_HOME/init.zsh

zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug "agkozak/zsh-z"
zplug "zpm-zsh/colors" # Better with grc
zplug "chrissicool/zsh-256color" # Desired by autosuggestions
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zdharma-continuum/fast-syntax-highlighting", defer:2
zplug "dracula/zsh", as:theme

if ! zplug check; then
    zplug install
fi
zplug load

# ================= Settings =================
setopt correct
setopt interactivecomments
autoload -Uz url-quote-magic; zle -N self-insert url-quote-magic
autoload -Uz bracketed-paste-magic; zle -N bracketed-paste bracketed-paste-magic

# Editor
setopt vi
export KEYTIMEOUT=1
EDITOR=vim
VISUAL=vim
PAGER=less
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Completion
autoload -Uz compinit && compinit
setopt complete_in_word
setopt auto_cd
if ! command -v zoxide &> /dev/null
    then zoxide-init
fi

# History
export HISTFILE="${HOME}/.zsh_history"
export HISTSIZE=1000
export SAVEHIST=1000
setopt share_history
setopt hist_ignore_space
setopt hist_ignore_all_dups
bindkey '^R' history-incremental-search-backward

# zsh-autosuggestions
bindkey '^F' autosuggest-execute
ZSH_AUTOSUGGEST_USE_ASYNC='YAAAAASSSSSS'

return 0
