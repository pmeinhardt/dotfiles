# explicitly initialize kubectl completion if needed to keep shell initialization quick
alias kubectl-init='[ $commands[kubectl] ] && source <(kubectl completion zsh)'
