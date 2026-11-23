if ! tty -s || [ ! -n "$TERM" ] || [ "$TERM" = dumb ]; then
  return
fi

if  (( ! $+commands[tspin] )); then
  return
fi

colorize() {
  local name=$1
  shift

  if [[ -t 1 ]] && (( $+commands[tspin] )); then
    command "${commands[$name]}" "$@" | command tspin
    return "${pipestatus[1]}"
  fi

  command "${commands[$name]}" "$@"
}

# Colorized commands
cmds=(id mtr ping ping6 traceroute traceroute6 uptime)

# Alias available commands
for cmd in $cmds ; do
  if (( $+commands[$cmd] )) ; then
    $cmd() { colorize "$0" "$@" }
  fi
done

# Clean up variables
unset cmds cmd
