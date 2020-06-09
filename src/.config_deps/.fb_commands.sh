export FBANDROID=~/fbsource/fbandroid
export FBOBJC=~/fbsource/fbobjc
export DEV=devvm31538.prn1.facebook.com

export PLAYGROUND=$FBOBJC/Apps/FBMessenger/MNMessagingApp/Settings/SupportedSettings/MIGComponentPlayground

export istable="remote/fbobjc/stable"
export astable="remote/fbandroid/stable"

alias objc="cd $FBOBJC"
alias android="cd $FBANDROID"
alias imig="cd $FBOBJC/Libraries/MIGKit"
alias ipg="cd $PLAYGROUND"

alias dev="mosh -6 $DEV"

## Workspace ##

alias refocus="arc refocus"

alias focus="arc focus --buck-target messenger-no-watch MIGKit ComponentKit MNUIComponents MIGPlayground MMNFBGroupChatsTabKit NMessagingBase"
alias dfocus="focus --arch arm64"
alias focus_feed="arc focus --buck-target wilde-no-extensions"
alias focus_work="arc focus --buck-target workplace-no-extensions"
alias dfocus_feed="focus_feed --arch arm64 --sdk iphoneos"
alias focusmigss="arc focus -b //Libraries/MIGKit:MIGKitSnapshotTests MIGKit FIGUIKit"
alias ffbss="arc focus -b //Libraries/FBComponentUI:FBComponentUIServerSnapshotTests MIGKit FIGUIKit"
alias focusmfs="focus MNMfsAccountManagementKit"
alias focusmig="arc focus --buck-target mig MIGKit ComponentKit MIGPlayground"
alias dfocusmig="focusmig --arch arm64"

alias afocus="arc focus --targets orca"

alias fb4a="buck install fb4a -r"
alias orca="buck install orca -r"
alias wilde="buck install wilde-no-extensions -r"
alias cs="buck install -r componentscript"

alias migss="buck install -r //Libraries/MIGKit:MIGKitSnapshotTests"
alias figss="buck install -r //Libraries/FIGUIKit:FIGUIKitServerSnapshotTests"

alias itestmig="buck test //Libraries/MIGKit:MIGKitTests"

alias focus_lockdown="focus_feed FBFeedStoryUFIComponent FBUFIKit FBCoreLocaleImpl FBUFIKit FBStoryShareHandler FBGroupsWilde FBGroupsGatekeeperExperiments FBMessengerIntegrationKit FBGroupMessengerIntegrationKit FBGroupsExperiments FBSectionComponentKit ComponentKit"
alias dfocus_lockdown="focus_lockdown --arch arm64"

## Mercurial/Phabricator ##

alias submit="jf submit"
alias prepare="submit --no-publish"
alias lint="arc lint;amend;"
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
