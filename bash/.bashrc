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
alias td="toolbox enter toolbox-devops"

# Toolbox specific
if [[ "$HOSTNAME" = "toolbox" ]]; then
	TOOLBOX_NAME=$(cat /run/.containerenv | grep "name=" | sed -e 's/^name="\(.*\)"$/\1/')

  if [[ -f /usr/share/git-core/contrib/completion/git-prompt.sh ]]; then
    . /usr/share/git-core/contrib/completion/git-prompt.sh
    export PS1="$TOOLBOX_NAME \[\033[32m\]\w\[\033[33m\]\$(GIT_PS1_SHOWUNTRACKEDFILES=1 GIT_PS1_SHOWDIRTYSTATE=1 __git_ps1)\[\033[00m\] $ "
  else
    export PS1="$TOOLBOX_NAME \[\033[32m\]\w\[\033[33m\]\[\033[00m\] $ "
  fi

  if [ -z "$TMUX" ]; then tmux; fi

  alias ls="lsd"
  alias gs="git status"
  alias venv-activate=". venv/bin/activate"
  
  export KUBECONFIG="$HOME/.kube/config:$HOME/.kube/home-config"
fi
