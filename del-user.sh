#!/bin/sh

username=$1

if [[ -z "$username" ]]; then
    echo "Usage: $0 [user]"
    exit 1
fi


### Remove user with home directory
deluser -f -r ${username}

