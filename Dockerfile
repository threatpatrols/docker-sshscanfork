
# https://hub.docker.com/_/ruby/tags
FROM ruby:3-alpine

WORKDIR /app
ADD . /app

ENV GEM_HOME /usr/local/bundle/ruby/$RUBY_VERSION

RUN set -x \
    && apk --update add openssh-client \
    && apk --update add --virtual build-dependencies build-base \
    && bundle install \
    && apk del build-dependencies build-base ruby-dev \
    && rm -rf /var/cache/apk/*

RUN set -x \
    # && ruby /app/scripts/Ubuntu.rb \
    && /app/bin/ssh_scan --help

ENTRYPOINT ["/app/bin/ssh_scan"]
