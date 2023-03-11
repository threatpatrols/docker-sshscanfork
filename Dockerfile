FROM ruby:3.0-alpine

WORKDIR /app
ADD . /app

ENV GEM_HOME /usr/local/bundle/ruby/$RUBY_VERSION

RUN set -x \
    && apk --update add openssh-client \
    && apk --update add --virtual build-dependencies build-base \
    && bundle install \
    && apk del build-dependencies build-base \
    && rm -rf /var/cache/apk/*

ENTRYPOINT ["/app/bin/ssh_scan"]
