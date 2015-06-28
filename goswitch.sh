#!/bin/bash
# GoSwitch: Portable Go Projects by Iyobo Eki
# 
# A little script to help you manage your various Golang Projects and their individual GoPaths.
# Simply put this script in the root directory of all your various GoPaths and run it with "source goActive.sh" to set that directory as your current active go project directory (or gopath). 
# The script will also add the bin folder of your project into your system path variable so you can run all your bins as you would any command line command e.g. 'beego run'

# WARNING: This script will modify your PATH variable and likely other environmental variables.
# By using it, you acknowledge that I cannot/will not be held liable for any negative effect that might have on your system.

echo "  GoSwitch v0.0.1 by Iyobo Eki "
path_append ()  { path_remove $1; export PATH="$PATH:$1"; }
path_prepend () { path_remove $1; export PATH="$1:$PATH"; }
path_remove ()  { export PATH=`echo -n $PATH | awk -v RS=: -v ORS=: '$0 != "'$1'"' | sed 's/:$//'`; }

path_remove $GOPATH/bin
# touch gopath.old

# if  ! grep -Fxq $GOPATH gopath.old ; then
# 	echo "   Updating gopath.old..."
# 	echo $GOPATH > gopath.old
# fi

GOPATH=$PWD
path_append $GOPATH/bin

echo "    Your new Gopath is $(tput setaf 6)$GOPATH.$(tput sgr 0) "
echo  "    Your project's bin folder ($(tput setaf 6)$GOPATH/bin$(tput sgr 0)) has been $(tput setaf 3)added to your PATH$(tput sgr 0)."
echo  "    You can now easily run execs in your project's bin folder e.g. $(tput setaf 11)beego run$(tput sgr 0)"



