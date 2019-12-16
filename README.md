# Borg server

## Usage

`docker run -v /local/dir:/home --name borg -p 22:22 tevin/borg-server`


### User management

#### Create a new user

```shell
> docker exec -it borg /bin/sh
> borg_users create tevin tevino  # The user `tevin` will be created with authorized keys of GitHub user `tevino` from https://github.com/tevino.keys

> borg_users create
Usage: borg_users create USER [Github UID(tevino)]"

```

#### More on user management

```shell
> borg_users
Usage: borg_users COMMAND

COMMAND: create|delete|list

    create: Create a new user.
    delete: Delete a user and all its files.
    ls|list: List existing users.
```

