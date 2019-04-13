if test -d ~/Library/Application\ Support/Spectacle
then
  source=$(realpath $(dirname $0)/shortcuts.json)
  cp $source ~/Library/Application\ Support/Spectacle/Shortcuts.json
fi
