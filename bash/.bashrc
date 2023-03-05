# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
  PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Helper functions
function tb { toolbox enter "toolbox-$1"; }
function installed { command -v "$1" &> /dev/null; }

# Toolbox specific
if [ "$HOSTNAME" = "toolbox" ]; then
  # Environment variables
  export TOOLBOX_NAME=$(cat /run/.containerenv | grep "name=" | sed -e 's/^name="toolbox-\(.*\)"$/\1/')
  export KUBECONFIG="$HOME/.kube/config:$HOME/.kube/home-config"

  # PS1 with git if present
  if [ -f /usr/share/git-core/contrib/completion/git-prompt.sh ]; then
    . /usr/share/git-core/contrib/completion/git-prompt.sh
    export PS1="\[\033[32m\]\w\[\033[33m\]\$(GIT_PS1_SHOWUNTRACKEDFILES=1 GIT_PS1_SHOWDIRTYSTATE=1 __git_ps1)\[\033[00m\] $ "
  else
    export PS1="\[\033[32m\]\w\[\033[33m\]\[\033[00m\] $ "
  fi

  # Aliases
  if installed lsd; then alias ls="lsd"; fi
  alias gs="git status"
  alias venv-activate=". venv/bin/activate"
  
  # Enter tmux by default
  if installed tmux && [ -z "$TMUX" ]; then tmux; fi
fi
