#!/bin/bash
# GoSwitch: Portable Go Projects by Iyobo Eki
# 
# A little script to help you manage your various Golang Projects and their individual GoPaths.
# Simply put this script in the root directory of all your various GoPaths and run it with "source goswitch.sh" to set that directory as your current active go project directory (or gopath).
# The script will also add the bin folder of your project into your system path variable so you can run all your bins as you would any command line command e.g. 'beego run'
echo "  GoSwitch v0.0.3"
echo "    The GOPATH switcher by Iyobo Eki"
path_append ()  { path_remove $1; export PATH="$PATH:$1"; }
path_prepend () { path_remove $1; export PATH="$1:$PATH"; }
path_remove ()  { export PATH=`echo -n $PATH | awk -v RS=: -v ORS=: '$0 != "'$1'"' | sed 's/:$//'`; }

#vars
newgopath=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
oldgopath=$GOPATH
gsbashrc=~/.bashrc
#gsbashprofile=~/.bash_profile

path_remove $oldgopath/bin

#Remove from bash inits
grep -v "source $GOPATH/goswitch.sh" $gsbashrc > bashtemp
mv bashtemp $gsbashrc
#grep -v "source $GOPATH/goswitch.sh" $gsbashprofile > bashptemp
#mv bashptemp $gsbashprofile

# touch gopath.old

# if  ! grep -Fxq $GOPATH gopath.old ; then
# 	echo "   Updating gopath.old..."
# 	echo $GOPATH > gopath.old
# fi

export GOPATH=$newgopath
path_append $GOPATH/bin
export GOROOT=/usr/local/go

echo "source $GOPATH/goswitch.sh" >> $gsbashrc
#echo "source $GOPATH/goswitch.sh" >> $gsbashprofile


echo "    Your Gopath is now $(tput setaf 6)$GOPATH.$(tput sgr 0) "
echo  "    Your project's bin folder ($(tput setaf 6)$GOPATH/bin$(tput sgr 0)) has been $(tput setaf 3)added to your PATH$(tput sgr 0)."
echo  "    You can now easily run execs in your project's bin folder e.g. $(tput setaf 11)beego run$(tput sgr 0)"
echo "    Who says you don't need to set GOROOT? Your new GOROOT is $(tput setaf 6)$GOROOT.$(tput sgr 0) "

#Source from bashrc
