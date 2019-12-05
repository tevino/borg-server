# Borg server

## Usage

`docker run -v /repo/dir:/home/borg/Repository -e BORG_UID=500 -e BORG_GID=1000 -e GITHUB_USERNAME=tevino -p 22:22 tevin/borg-server`


### BORG_UID and BORG_GID

The user ID and groups ID of the default user `borg` will be changed to given value


### GITHUB_USERNAME

The container will execute the following on startup:

`wget https://github.com/${GITHUB_USERNAME}.keys -O /home/borg/.ssh/authorized_keys`

