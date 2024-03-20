ARG ALPINE_VER=3.18
# ベースイメージを定義
FROM docker.io/alpine:$ALPINE_VER
# Primery packages
ENV TZ=Asia/Tokyo
RUN apk add --update --no-cache tzdata coreutils procps busybox-suid sudo bash && \
    cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    echo "Asia/Tokyo" > /etc/timezone
COPY ./nk225notify /usr/local/bin/nk225notify
COPY ./root_fs /
WORKDIR /usr/local/bin/nk225notify
RUN addgroup -g 1000 -S nk225 && \
    adduser -u 1000 -S nk225 -G nk225 && \
    apk add --update --no-cache s6-overlay \
                     py3-pip \
                     python3 py3-beautifulsoup4 py3-requests curl && \
    crontab -r && \
    chown -R nk225:nk225 /usr/local/bin/nk225notify && \
    sudo -u nk225 pip3 install jpholiday
VOLUME /usr/local/bin/nk225notify/settings
VOLUME /etc/crontabs
ENTRYPOINT ["/init"]
