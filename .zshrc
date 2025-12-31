setopt interactive_comments
setopt shwordsplit
setopt hist_ignore_dups
setopt hist_subst_pattern
unsetopt histexpand

export HISTSIZE=1000000
export SAVEHIST=1000000
export EDITOR=vi

readonly prompt
PS1='%2~ %% '

bindkey -e
bindkey "^[[3~" delete-char # zed needs this for some reason

hash -d d=~/Documents
hash -d D=~d
hash -d p=~/Documents/Projects
hash -d P=~p
hash -d n=~/Library/Mobile\ Documents/com~apple~CloudDocs/notes
hash -d N=~n

alias lc=eza
#alias cat=bat
alias vi='nvim'
alias ca='cursor-agent --force'
alias a='vim ~n/a.md'
alias fd='fd -Ig'
alias chrome='open -a "Google Chrome"'

#chrome() { open -a 'Google Chrome' "$@" && exit; }

for file in /Applications/*.app ~/Applications/*.app; do
    app=${file:t:r:l:gs/[^a-z0-9]/_/}
    if ! command -v "$app" >/dev/null; then
        eval "${app:q} () { open -a ${file:q} \${@:q} && exit; }"
    fi
done

key() {
  for name; do
    while read -r match; do
      eval export "$match"
      echo "Exported ${match%%=*}" >&2
    done < <(grep -F "$name" ~/.keys)
  done
}

key GEMINI OPENAI CEREBRAS XAI 2>/dev/null

conda_init() {
  __conda_setup="$('/Users/tm/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
  if [ $? -eq 0 ]; then
    eval "$__conda_setup"
  else
    if [ -f "/Users/tm/miniconda3/etc/profile.d/conda.sh" ]; then
      . "/Users/tm/miniconda3/etc/profile.d/conda.sh"
    else
      export PATH="/Users/tm/miniconda3/bin:$PATH"
    fi
  fi
  unset __conda_setup
}

export OPENSSL_ROOT_DIR=/opt/homebrew/opt/openssl@3

#source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
