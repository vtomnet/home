eval "$(/opt/homebrew/bin/brew shellenv)"

export BUN_INSTALL="$HOME/.bun"
export path=(
  ~/.local/bin
  $BUN_INSTALL/bin
  ~/.juliaup/bin
  ~/.opencode/bin
  ~/.amp/bin
  ~/go/bin
  $path
)

export LESS="-Ri"
export GIT_PAGER="less -F"
export PYTHONSTARTUP=~/.pythonrc

. "$HOME/.cargo/env"

export HF_HOME="/Volumes/App Support/huggingface"
