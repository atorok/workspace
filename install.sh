#!/bin/bash

. shellib/bash_colors.sh

set -e 

#
# Determine the profile dir
#
WDR=`which $0`
WDR=`dirname $WDR`
PROFILE_DIR=$WDR/profiles
		
INSTALL_PREFIX=${INSTALL_PREFIX:-~}

clr_green "Going to install into $INSTALL_PREFIX"



#
# Install the actual stuff
#
install() {
  PROFILE_NAME=$1  
  MODULE_NAME=$2
  DST_MODULE_NAME=$3
  DST=$INSTALL_PREFIX/$DST_MODULE_NAME
  SRC=$PROFILE_DIR/$PROFILE_NAME/$MODULE_NAME  
  if ! [ -e "$SRC" ] ; then
    clr_red "Skipping $MODULE_NAME from $PROFILE_NAME : not present"
	return
  fi
  clr_brown "Installing $DST_MODULE_NAME from $PROFILE_NAME"
  if [ -d $SRC ] ; then
	  mkdir -p $DST
	  `which cp` -s  -r -f $SRC/* $DST/
  else
	  `which cp` -s -f $SRC $DST
  fi
}


install_profile() {
  local name=$1
  clr_green "== Installing profile $name =="
  . profiles/$name/profile.info
  for module in $DOTMODULES ; do
    install $name $module .$module
  done
  for module in $MODULES ; do 
    install $name $module $module 
  done
  for module in $PREFIXED_DOTMODULES ; do
    install $name $module .$module.${NAME_PREFIX}
  done
  for module in $PREFIXED_MODULES ; do 
    install $name $module $module.${NAME_PREFIX}
  done
}

if [ -z "$1" ] ; then
   install_profile "base" 
   install_profile "zsh" 
   install_profile "bash"
else
   install_profile "$1"
fi

sudo cp -v jetbrains-idea.desktop /usr/share/applications

echo
clr_green "Success"
echo
