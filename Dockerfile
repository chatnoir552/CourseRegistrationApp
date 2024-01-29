FROM ruby:3.1

RUN mkdir /app
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install
ADD . /app
RUN mkdir -p tmp/sockets

VOLUME /app/public
VOLUME /app/tmp


