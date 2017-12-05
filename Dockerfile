FROM ruby:2.4.2-alpine3.6

LABEL maintainer="David Gillies <dave.gillies@gmail.com>"
ENV vmail_version 2.9.8

RUN adduser -D -h /home/vmail -u 1000 vmail
RUN apk -U add --no-cache --virtual .build-deps build-base sqlite-dev libffi-dev ; \
    # echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories ; \
    gem install --no-ri --no-rdoc vmail --version ${vmail_version} ; \
    apk del .build-deps ; \
    apk -U add vim elinks sqlite-libs git curl

COPY .vim/ /home/vmail/.vim
COPY .vimrc /home/vmail/.vimrc
RUN chown -R vmail /home/vmail

USER vmail

ENV HOME /home/vmail
ENV TERM xterm-256color
ENV VMAIL_BROWSER elinks

RUN vim -u /home/vmail/.vim/rc/plugins.vim -i NONE -c PlugUpdate -c PlugClean! -c quitall

CMD ["vmail"]
