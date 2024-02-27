export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
if [[ -d $PYENV_ROOT/bin ]] then
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi
eval "$(/opt/homebrew/bin/brew shellenv)"
