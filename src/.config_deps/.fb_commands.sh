alias objc="cd ~/fbsource/fbobjc"
alias android="cd ~/fbsource/fbandroid"

alias dev="mosh -6 $DEV"

## Workspace ##

alias focus="arc focus --buck-target messenger-no-watch"
alias focus_feed="arc focus --buck-target wilde-no-extensions"
alias dfocus_feed="focus_feed --arch arm64 --sdk iphoneos"

## Android ##

alias sdk="sudo /opt/android_sdk/tools/android sdk"
alias avd="sudo /opt/android_sdk/tools/android avd"

## Components ##

alias bounds="~/fbsource/fbandroid/scripts/dumpapp components highlight bounds"

## Tools ##

alias build="$FBANDROID/scripts/auto_build.py"
alias abgs="abgs -i" # ignore cases
