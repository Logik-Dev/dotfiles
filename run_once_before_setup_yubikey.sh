#!/bin/bash

CONFIG_FOLDER=$HOME/.config/Yubico
CONFIG_FILE=$CONFIG_FOLDER/u2f_keys

# Install yubikey related packages
sudo dnf install pam-u2f pamu2fcfg fido2-tools

# If config exists add new key for current user
if [ -f "$CONFIG_FILE" ]; then
	
	# Ask if it should add a new key
	read -p "Ajouter une nouvelle clef ? " -n 1 -r

	# New line
	echo

	# Add new key
	if [[ $REPLY =~ ^[YyOo]$ ]]
	then
		pamu2fcfg  --nouser >> $CONFIG_FILE
	fi

# Else create file and add first key
else 
	mkdir -p $CONFIG_FOLDER
	pamu2fcfg > $CONFIG_FILE
fi

# Enable authselect u2f profile
sudo authselect select sssd with-pam-u2f

# Add SSH keys from Yubikey
mkdir -p $HOME/.ssh
cd $HOME/.ssh
ssh-keygen -K
