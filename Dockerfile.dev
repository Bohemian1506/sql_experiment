# Dockerfile（更新版）
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

# Gemfileをコピーして依存関係をインストール
COPY Gemfile* ./
RUN bundle install

COPY . .

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]