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

alias te="toolbox enter"
alias tb="toolbox enter toolbox-base"

# Toolbox specific
if [[ "$HOSTNAME" = "toolbox" ]]; then
  if [ -z "$TMUX" ]; then tmux; fi

  alias ls="lsd"
  alias gs="git status"
  alias venv-activate=". venv/bin/activate"
  
  export KUBECONFIG="$HOME/.kube/config:$HOME/.kube/home-config"
  export SOPS_AGE_KEY_FILE="$HOME/.config/sops/age/keys.txt"
fi
