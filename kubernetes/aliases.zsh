# Explicitly initialize kubectl completion if needed to keep shell initialization snappy.
alias kubectl-init='[ $commands[kubectl] ] && source <(kubectl completion zsh)'
