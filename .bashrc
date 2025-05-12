#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
if [[ -f "$HOME/.cache/wal/sequences" ]]; then
  (cat "$HOME/.cache/wal/sequences")
fi
export DOTNET_ROOT=/usr/share/dotnet
export PATH=$PATH:/usr/share/dotnet

export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# For NTFS-3g mounts
export LS_COLORS="$LS_COLORS:ow=01;34:tw=01;34"

#oh-my-posh
export PATH=$PATH:$HOME/.local/bin/
eval "$(oh-my-posh init bash --config 'https://github.com/JanDeDobbeleer/oh-my-posh/blob/main/themes/easy-term.omp.json')"

# Fuzzy find and edit files with nvim
fe() {
  local file
  file=$(fd --type f --hidden --exclude .git | fzf --preview 'bat --color=always {}') &&
    nvim "$file"
}

# Add to ~/.bashrc
alias dotsync='cp ~/.bashrc ~/dotfiles/.bashrc && git -C ~/dotfiles commit -am "Update .bashrc $(date)" && git -C ~/dotfiles push'

dotfile-backup() {
  cp ~/.bashrc ~/dotfiles/.bashrc
  # cp ~/.config/nvim/lua/ ~/dotfiles/lua/
  rsync -ac --delete ~/.config/nvim/ ~/dotfiles/nvim

  cd ~/dotfiles || exit 1

  if [[ -n $(git status --porcelain) ]]; then
    echo "🔄 Changes detected! Committing and pushing..."
    git add .
    git commit -m "Update backup-setting $(date +'%Y-%m-%d %H:%M:%S')"
    git push
    echo "✅ Successfully updated dotfiles repo!"
  else
    echo "⏩ No changes detected in dotfiles repo. Skipping commit."
  fi

  cd - >/dev/null || return
}
