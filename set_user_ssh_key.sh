#!/bin/bash
# Required parameters: 
#	1. username
#	2. ssh key
#
# Assign parameters
user_dir=/home/$1
ssh_key=$2
ssh_dir=$user_dir/.ssh
auth_keys_file=$ssh_dir/authorized_keys
# Create ssh dir
mkdir -m 0700 $ssh_dir
# Create authorized keys file
touch $auth_keys_file
# Set permissions
chmod 0600 $auth_keys_file
# Write ssh key contents into authorized keys file
echo $ssh_key >> $auth_keys_file
