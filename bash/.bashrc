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

# Toolbox specific
if [[ "$HOSTNAME" = "toolbox" ]]; then
  alias ls="lsd"
  alias te="toolbox enter"
  alias gs="git status"
  alias venv-activate=". venv/bin/activate"
  
  export KUBECONFIG="$HOME/.kube/config:$HOME/.kube/home-config"
  export SOPS_AGE_KEY_FILE="$HOME/.config/sops/age/keys.txt"
fi
