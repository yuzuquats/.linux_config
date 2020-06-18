echo importing .bash_profile

if [ -f ~/.bashrc ]; then . ~/.bashrc; fi

#. ~/.fbchef/environment

##
# Your previous /Users/jameskao/.bash_profile file was backed up as /Users/jameskao/.bash_profile.macports-saved_2019-01-29_at_11:18:46
##

# MacPorts Installer addition on 2019-01-29_at_11:18:46: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.


export PATH="$HOME/.cargo/bin:$PATH"

# BEGIN: Block added by chef, to set environment strings
# Please see https://fburl.com/AndroidProvisioning if you do not use bash
# or if you would rather this bit of code 'live' somewhere else
. ~/.fbchef/environment
# END: Block added by chef
