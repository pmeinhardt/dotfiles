ANDROID_SDK_ROOT=~/Library/Android/sdk

if [ -d "$ANDROID_SDK_ROOT" ]; then
  export ANDROID_SDK_ROOT
  export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
  export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools
  export PATH=$PATH:$ANDROID_SDK_ROOT/tools
  export PATH=$PATH:$ANDROID_SDK_ROOT/tools/bin
fi
