FROM alpine:3.3
MAINTAINER Stephane Jourdan <fasten@fastmail.fm>
ENV REFRESHED_AT 2016-02-27
RUN apk update &&\
    apk upgrade && \
    apk add openssh-sftp-server dropbear sudo &&\
    rm -rf /var/cache/apk/*
RUN mkdir /etc/dropbear
RUN touch /var/log/lastlog
RUN echo '%wheel ALL=(ALL) ALL' >> /etc/sudoers
COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["dropbear", "-RFEmwg", "-p", "22"]
