export FBANDROID=~/fbsource/fbandroid

alias objc="cd ~/fbsource/fbobjc"
alias android="cd ~/fbsource/fbandroid"

alias dev="mosh -6 $DEV"

## Workspace ##

alias focus="arc focus --buck-target messenger-no-watch"
alias focus_feed="arc focus --buck-target wilde-no-extensions"
alias dfocus_feed="focus_feed --arch arm64 --sdk iphoneos"

alias fb4a="buck install fb4a -r"
alias orca="buck install orca -r"

## Android ##

export PATH="/opt/android_ndk/android-ndk-r12b:$PATH"
export PATH="/opt/android_sdk/tools:$PATH"
export PATH="/opt/android_sdk/tools/bin:$PATH"
export PATH="/opt/android_sdk/platform-tools:$PATH"
export ANDROID_SDK=/opt/android_sdk
export ANDROID_HOME=/opt/android_sdk
export ANDROID_NDK_REPOSITORY=/opt/android_ndk
alias sdk="sudo /opt/android_sdk/tools/android sdk"
alias avd="sudo /opt/android_sdk/tools/android avd"

alias fixtests="sudo launchctl limit maxfiles 1000000 1000000"
alias test_styling="buck test //javatests/com/facebook/feed/rows/styling:styling"
alias test_reaction_styling="buck test //javatests/com/facebook/reaction/feed:feed"
alias test_plugins="buck test //javatests/com/facebook/feedplugins/base:base"

## Components ##

alias bounds="~/fbsource/fbandroid/scripts/dumpapp components highlight bounds"

## Tools ##

alias build="$FBANDROID/scripts/auto_build.py"
alias abgs="abgs -i" # ignore cases
alias mc="$FBANDROID/scripts/mobileconfig-refresh.sh"
alias ss="$FBANDROID/instrumentation_tests/run"

renameAssets() {
  for i in *@*.png ;
  do
    FILE="${i/@*}"
    echo "sutro_$FILE.png"
    mv "$i" "sutro_$FILE.png"
  done
}

removeDashes() {
  shopt -s nullglob
  for i in * ;
  do
    #echo "$i"
    echo "${i/@*.png/.png}"
    mv $i ${i/@*.png/.png}
    #mv $i ${i/-ol/_ol}
  done
}
