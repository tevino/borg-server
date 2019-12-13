FROM alpine:latest

RUN apk --no-cache add borgbackup openssh-server shadow \
&& rm -rf /var/cache/apk/*

RUN set -x \
    && sed -i \
        -e 's/^#PasswordAuthentication yes$/PasswordAuthentication no/g' \
        -e 's/^X11Forwarding yes$/X11Forwarding no/g' \
        /etc/ssh/sshd_config

RUN ssh-keygen -A

ADD ./*.sh /

RUN /add-user.sh borg

VOLUME /home

EXPOSE 22

CMD ["/entrypoint.sh"]

