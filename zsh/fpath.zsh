# Add topic folders to fpath so they can add functions and completion scripts
for topic_folder ($ZSH/*) if [ -d $topic_folder ]
then
  fpath=($topic_folder $fpath)
fi

# Add Homebrew’s completions if they are not in the default ZSH fpath,
# i.e. they are not in /usr/local/share/zsh/site-functions
if (( $+commands[brew] )) && [ $(brew --prefix) != "/usr/local" ]
then
  fpath=($fpath $(brew --prefix)/share/zsh/site-functions)
fi
