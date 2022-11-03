#!/usr/bin/env bash

red="$(tput setaf 1)"
green="$(tput setaf 2)"
yellow="$(tput setaf 3)"
bold="$(tput md)"
reset="$(tput sgr0)$(tput op)"

prompt () {
  local -r msg=$1
  local response

  printf "%s %s" "$msg" "${green}" >&2
  read -r response

  printf "%s" "${reset}" >&2

  echo "$response"
}

spinner () {
  local -r pid=$1
  local -r msg=$2

  local -r frames="⠋⠙⠹⠸⠼⠴⠦⠧⠇⠏"
  local -r len=${#frames}
  local -r delay=0.1

  local -i i=0
  local frame=

  tput sc # store cursor position

  while kill -0 "$pid" &> /dev/null; do
    frame="${frames:((i++%len)):1}"
    printf "${bold}%s %s${reset}" "$frame" "$msg"

    sleep $delay

    tput rc # restore cursor position
    tput el # clear to end of line
  done
}

heading () {
  local -r msg=$1
  printf "\n${bold}%s${reset}\n\n" "$msg"
}

success () {
  local -r msg=$1
  printf "${green}✔ %s${reset}\n" "$msg"
}

failure () {
  local -r msg=$1
  printf "${red}✘ %s${reset}\n" "$msg"
}

warning () {
  local -r msg=$1
  printf "${yellow}⚠ %s${reset}\n" "$msg"
}

info () {
  local -r msg=$1
  printf "ℹ %s\n" "$msg"
}

indent () {
  local -ir width=$1
  printf "%${width}s" ""
}

cleanup () {
  code=$?

  for j in $(jobs -p); do
    kill "$j"
    wait "$j" &> /dev/null
  done

  return $code
}

execute () {
  local -r cmd="$1"
  local -r msg="${2:-$cmd}"

  local -i code=
  local -i pid=

  trap -p EXIT | grep cleanup &> /dev/null || trap cleanup EXIT

  eval "$cmd" &> /dev/null & # run command in background
  pid=$!

  spinner $pid "$msg"

  wait $pid &> /dev/null
  code=$?

  if [ $code -eq 0 ]; then
    success "$msg"
  else
    failure "$msg"
  fi

  return $code
}
