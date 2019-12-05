FROM alpine:latest

RUN apk --no-cache add borgbackup openssh-server shadow \
&& rm -rf /var/cache/apk/*

RUN set -x \
    && sed -i \
        -e 's/^#PasswordAuthentication yes$/PasswordAuthentication no/g' \
        -e 's/^X11Forwarding yes$/X11Forwarding no/g' \
        /etc/ssh/sshd_config

RUN ssh-keygen -A

RUN adduser --disabled-password --gecos "Borg Backup" borg \
 # This "unlocks" the user borg so it may log through ssh, more here: https://arlimus.github.io/articles/usepam/
 && sed -i -e 's/^borg:!:/borg:\*:/' /etc/shadow


USER borg

RUN mkdir ~/.ssh && chmod 700 ~/.ssh

USER root

VOLUME /home/borg/Repository

ADD ./entrypoint.sh /

EXPOSE 22

CMD ["/entrypoint.sh"]

