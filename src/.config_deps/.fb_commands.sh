export PATH="$HOME/tools/protobuf-c/protoc-c:$PATH"
export PATH="$HOME/dotfiles/src/fb_commands:$PATH"
export PKG_CONFIG_PATH=/System/Library/Frameworks/Python.framework/Versions/2.7/lib/pkgconfig

export FBANDROID=~/fbsource/fbandroid
export FBOBJC=~/fbsource/fbobjc
export WAOBJC=~/whatsapp/iphone
export WAANDROID=~/whatsapp/android
export FBCODE=~/fbsource/fbcode
export XPLAT=~/fbsource/xplat
export DEV=devvm675.prn0.facebook.com

alias xplat="cd $XPLAT"
alias objc="cd $FBOBJC"
alias android="cd $FBANDROID"
alias imig="cd $FBOBJC/Libraries/MIGKit"
alias ipg="cd $PLAYGROUND"
alias wa="cd $WAOBJC"
alias waandroid="cd $WAANDROID"
alias common="cd $HOME/whatsapp/common"
alias avoip="cd $WAANDROID/app/jni/voip.git"
alias voip="cd $WAOBJC/submodules/voip"
alias tivi="cd $HOME/fbsource/xplat/experimental/jameskao/tivi"

alias msys="cd $XPLAT/msys"
alias wamsys="cd $XPLAT/wa-msys"

alias repl="cd ~/whatsapp/cf/repl"
alias bridges="cd $FBOBJC/Libraries/WAMsysBridgeApple"

alias cf="cd ~/whatsapp/cf"
alias smax="cd ~/whatsapp/smax"
alias common="cd ~/whatsapp/common"

alias dev="mosh -6 $DEV"
alias dev2="ssh -AC jameskao@$DEV"

## Workspace ##

alias wpull='git pull --rebase;git submodule update;'
alias wwa='open $WAOBJC/WhatsApp.xcworkspace'

alias refocus="arc refocus --no-fast-link"
alias kreset="kdestroy;kinit;"

## Mercurial/Phabricator ##

alias submit="jf submit --no-publish"
alias prepare="submit"
alias lint="arc lint"
alias commit="hg commit -Am "

alias r2is="hg rebase -d $istable -s "
alias r2as="hg rebase -d $astable -s "
alias r2m="hg rebase -d remote/master -s "

## Android ##

alias fixtests="sudo launchctl limit maxfiles 1000000 1000000"
alias test_styling="buck test //javatests/com/facebook/feed/rows/styling:styling"
alias test_reaction_styling="buck test //javatests/com/facebook/reaction/feed:feed"
alias test_plugins="buck test //javatests/com/facebook/feedplugins/base:base"

## iOS ##

alias remodel="$FBOBJC/Tools/remodel/bin/generate "
alias injectAll="$FBOBJC/Tools/generateIngen.sh"
alias inject="$FBOBJC/Tools/ingen/bin/generate "

## Components ##

alias bounds="~/fbsource/fbandroid/scripts/dumpapp components highlight bounds"

## Tools ##

alias build="$FBANDROID/scripts/auto_build.py"
alias ab="amend;build;"
alias abgs="abgs -i" # ignore cases
alias mc="$FBANDROID/scripts/mobileconfig-refresh.sh"
alias ss="$FBANDROID/instrumentation_tests/run"
alias f="flutter.local"
