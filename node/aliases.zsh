# explicitly initialize nvm if needed to keep shell initialization quick
# https://github.com/creationix/nvm/issues/782
alias nvm-init='export NVM_DIR="$HOME/.nvm" && [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" && [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"'
