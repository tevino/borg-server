FROM alpine:latest

RUN apk --no-cache add borgbackup openssh-server shadow wget \
&& rm -rf /var/cache/apk/*

RUN set -x \
    && sed -i \
        -e 's/^#PasswordAuthentication yes$/PasswordAuthentication no/g' \
        -e 's/^X11Forwarding yes$/X11Forwarding no/g' \
        /etc/ssh/sshd_config

RUN ssh-keygen -A

ADD ./entrypoint.sh ./borg_users /usr/local/bin/

RUN borg_users create borg

VOLUME /home

EXPOSE 22

CMD ["/usr/local/bin/entrypoint.sh"]

