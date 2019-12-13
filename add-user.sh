#!/bin/sh

username=$1
github=${2:-tevino}

if [[ -z "$username" ]]; then
    echo "Usage: $0 user [Github UID]"
    exit 1
fi

### Add user

adduser --disabled-password --gecos "Borg Backup User $username" "$username"
# This "unlocks" the user so it may log through ssh, more here: https://arlimus.github.io/articles/usepam/
sed -i -e "s/^${username}:!:/${username}:\*:/" /etc/shadow
mkdir /home/${username}/.ssh && chmod 700 /home/${username}/.ssh


### Download github keys
wget https://github.com/${github}.keys -O /home/${username}/.ssh/authorized_keys
chown ${username}:${username} /home/${username}/.ssh/authorized_keys


### Add restriction to keys

sed -i -e "s/^/command=\"borg serve --restrict-to-path \/home\/${username}\",restrict /g" /home/${username}/.ssh/authorized_keys
chmod 600 /home/${username}/.ssh/authorized_keys


### Add repo directory

mkdir /home/${username}/repos

### Set owner

chown -R ${username}:${username} /home/${username}

