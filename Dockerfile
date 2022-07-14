FROM docker.io/ruby:3.1-bullseye

WORKDIR /tmp
COPY Gemfile .
COPY Gemfile.lock .
RUN bundle config --global frozen 1 \
    && bundle install --jobs 6 --retry 5

WORKDIR /app
COPY . /app

RUN bundle install --jobs 6 --retry 5