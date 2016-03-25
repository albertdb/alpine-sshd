FROM alpine:3.3
RUN apk update &&\
    apk upgrade && \
    apk add openssh-sftp-server dropbear sudo s6 libc6-compat &&\
    rm -rf /var/cache/apk/*
RUN mkdir /etc/dropbear /etc/s6
RUN touch /var/log/lastlog
RUN echo '%wheel ALL=(ALL) ALL' >> /etc/sudoers
COPY init /etc/
ENTRYPOINT ["/etc/init"]
CMD ["dropbear", "-RFEmwg", "-p", "22"]
