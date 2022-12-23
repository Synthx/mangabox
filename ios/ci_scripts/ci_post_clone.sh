#!/bin/sh

cd "$CI_WORKSPACE"

git clone "https://github.com/flutter/flutter.git" --depth 1 -b stable "$HOME/flutter"
export PATH="$PATH:$HOME/flutter/bin"

flutter precache --ios
flutter pub get
flutter pub run build_runner build

HOMEBREW_NO_AUTO_UPDATE=1
brew install cocoapods

cd ios && pod install

exit 0
