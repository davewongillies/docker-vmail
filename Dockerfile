FROM ruby:alpine

MAINTAINER David Gillies <dave.gillies@gmail.com>
RUN adduser -D -h /home/vmail -u 1000 vmail
RUN apk -U add --no-cache --virtual .build-deps build-base sqlite-dev libffi-dev ; \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories ; \
    gem install --no-ri --no-rdoc vmail ; \
    apk del .build-deps ; \
    apk -U add vim elinks sqlite-libs git

COPY .vim/ /home/vmail/.vim
COPY .vimrc /home/vmail/.vimrc
RUN chown -R vmail /home/vmail

ENV VMAIL_BROWSER elinks
USER vmail
RUN vim -u /home/vmail/.vim/rc/plugins.vim -i NONE -c VundleUpdate -c PluginClean! -c quitall
ENV HOME /home/vmail
ENV TERM xterm-256color
CMD ["vmail"]
