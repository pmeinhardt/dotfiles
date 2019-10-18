# Enable shell history for Erlang.
export ERL_AFLAGS='-kernel shell_history enabled'

# At startup, epmd checks the environment variable ERL_EPMD_ADDRESS to figure
# out what IP addresses to listen on. You can set this variable to 127.0.0.1 to
# make epmd listen on the loopback interface only.
export ERL_EPMD_ADDRESS=127.0.0.1
