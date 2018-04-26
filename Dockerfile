FROM node:6.14.1-alpine

ENV LOU_VER="v2.7.1"

RUN addgroup lounge && \
    adduser -D -h /opt -G lounge lounge && \
    echo "lounge:`head /dev/urandom | tr -dc A-Za-z0-9 | head -c 24 | mkpasswd -m sha256`" | chpasswd

RUN apk add -U git

USER lounge
RUN cd ~ && \
    git clone https://github.com/thelounge/thelounge && \
    cd thelounge && \
    git checkout tags/$LOU_VER && \
    yarn install && \
    NODE_ENV=production yarn build

CMD cd /opt/thelounge && yarn start
