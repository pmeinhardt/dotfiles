export GOPATH=$PROJECTS/go

if test -d "$GOPATH/bin"
then
  export PATH="$PATH:$GOPATH/bin"
fi
