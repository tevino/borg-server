# Borg server

## Usage

`docker run -v /local/dir:/home -e BORG_UID=500 -e BORG_GID=1000 -p 22:22 tevin/borg-server`


### BORG_UID and BORG_GID

The user ID and group ID of the default user `borg` will be changed to the given value.

