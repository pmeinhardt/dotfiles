# Add topic folders to fpath so they can add functions and completion scripts
for topic_folder ($ZSH/*) if [ -d $topic_folder ]
then
  fpath=($topic_folder $fpath)
fi

# Add Homebrew’s completions if they are not in the default ZSH fpath,
# i.e. they are not in /usr/local/share/zsh/site-functions
if [ -n "$HOMEBREW_PREFIX" ] && [ "$HOMEBREW_PREFIX" != "/usr/local" ]
then
  fpath=($fpath $HOMEBREW_PREFIX/share/zsh/site-functions)
fi
