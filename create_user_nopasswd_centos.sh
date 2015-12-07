#!/bin/bash

# Required parameters
#  1. User name (alphanumeric only)
#  2. User's ssh public key
#  3. User Groups

if [ -z "$1" ]; then
  echo "[Error] Argument 1 (username) is required."
  exit 1
fi
if [ -z "$2" ]; then
  echo "[Error] Argument 2 (ssh public key) is required."
  exit 1
fi

username="$1"
ssh_pub_key="$2"
[[ -z "$3" ]] && groups="" || groups="$3"

# Create user
sudo useradd $username

# Assign user to groups
[[ ! -z "$groups" ]] && sudo usermod -aG $groups $username

# Set SSH pub key
# Parameters
cmd_prefix="-u $username"
user_dir=/home/$username
ssh_dir=$user_dir/.ssh
auth_keys_file=$ssh_dir/authorized_keys
# Create ssh dir
# Create authorized keys file
# Set permissions
# Write ssh key contents into authorized keys file
sudo $cmd_prefix bash <<EOF
  mkdir -m 0700 $ssh_dir
  touch $auth_keys_file
  chmod 0600 $auth_keys_file
  echo $ssh_pub_key >> $auth_keys_file
EOF
