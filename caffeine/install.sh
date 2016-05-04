# Install Caffeine.app retina assets.

APP=/Applications/Caffeine.app

if test -d "$APP/Contents/Resources" && ! test -e "$APP/Contents/Resources/active@2x.png"
then
  echo "› installing caffeine retina assets (bkenny/retina-caffeine)"
  curl -fsSL https://github.com/bkenny/retina-caffeine/tarball/master | tar xz -m -C "$APP/Contents/Resources" --strip 1 -
fi
