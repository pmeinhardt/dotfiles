# Tell the terminal about the current working directory at each prompt.
if [[ "$TERM_PROGRAM" = "Apple_Terminal" ]] && [[ -z "$INSIDE_EMACS" ]]; then
  terminal_path_urlencode () {
    local exclude='[/._~A-Za-z0-9-]'
    local output=''
    local input=$1

    # Use LC_CTYPE=C to process text byte-by-byte.
    # Ensure that LC_ALL is not set, so it does not interfere.
    local LC_CTYPE=C LC_ALL=
    local i byte ord

    for (( i = 1; i <= ${#input}; ++i )); do
      byte="$input[i]"

      if [[ "$byte" =~ "$exclude" ]]; then
        output+="$byte"
      else
        ord=$(( [##16] #byte ))
        output+="%$ord"
      fi
    done

    echo -E "$output"
  }

  update_terminal_cwd () {
    # Identify the directory using a "file:" scheme URL, including
    # the host name to disambiguate local vs. remote paths.

    # Percent-encode the pathname.
    local URL_PATH="$(terminal_path_urlencode $PWD)"
    [ $? != 0 ] && return 1

    # Send terminal-specific control sequence.
    printf '\e]7;%s\a' "file://$HOST$URL_PATH"
  }

  precmd_functions+=(update_terminal_cwd)
fi

# Show username and host when connected via SSH or running as root
if [[ "$SSH_CONNECTION" != '' ]] || [[ $UID -eq 0 ]]; then
  PROMPT=$'\n%n@%m:%1~ ❯ '
else
  PROMPT=$'\n%1~ ❯ '
fi

export PROMPT
