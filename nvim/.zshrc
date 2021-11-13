#NVM
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

#case insensative completion 
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

#Prompt
PROMPT='%~ $ '

#another git prompt
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%F{040}(%b)%f'
zstyle ':vcs_info:*' enable git


#zsh-autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#696969"
ZSH_AUTOSUGGEST_STRATEGY=(history)
bindkey '^ ' autosuggest-accept

#Colored folders
alias ls='ls -G'

#Vim Alias
alias vim='nvim'
export EDITOR='nvim'

# KUBE_PS1 start
KUBE_PS1_SYMBOL_ENABLE=false
KUBE_PS1_NS_ENABLE=true

function get_cluster_short() {
  CLUSTER_NAME=$(echo $1 | awk -F / '{print $2}')
  SERVER=$(grep -A 1 -B 1 "${CLUSTER_NAME}" ~/.kube/config | grep server | sed -E "s/ *server: (.*)/\1/g")
  NEW_CLUSTER_NAMES=$(grep -A 1 -B 1 "${SERVER}" ~/.kube/config | grep name | grep -v ${CLUSTER_NAME} | sed -E "s/ *name: (.*)/\1/g")
  NEW_CLUSTER_NAME=${NEW_CLUSTER_NAMES%$'\n'*}
  if [[ -n "${NEW_CLUSTER_NAME}" ]]; then
    echo "${NEW_CLUSTER_NAME}"
  else
    echo ${CLUSTER_NAME}
  fi
}

KUBE_PS1_CLUSTER_FUNCTION=get_cluster_short
export PATH="${HOME}/bin:${PATH}"
source "${HOME}/bin/kube-ps1.sh"
PROMPT='$(kube_ps1)'$PROMPT
export PATH="${HOME}/.npm/bin:${PATH}"
alias ic="ibmcloud"
export PATH="/usr/local/opt/yq@3/bin:/Users/davidlevy/bin:/Users/davidlevy/.npm/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
export CGB_USER="05"
