FROM ruby:2.6.3-slim-stretch
WORKDIR /app

# nodejs
RUN apt-get update && apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get update && apt-get install -y nodejs

COPY Gemfile* ./
RUN bundle install -j4 --path vendor/bundle
