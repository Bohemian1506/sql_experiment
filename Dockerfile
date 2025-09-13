FROM ruby:3.3.0-slim

RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libvips \
    curl \
    git \
    libsqlite3-dev \
    nodejs \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN gem install rails -v "~> 8.0.0"

EXPOSE 3000
