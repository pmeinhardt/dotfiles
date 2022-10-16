export GOPATH=$PROJECTS/go

if [ -d "$GOPATH/bin" ]; then
  export PATH="$PATH:$GOPATH/bin"
fi
