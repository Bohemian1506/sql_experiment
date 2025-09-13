# Dockerfile.prod
FROM ruby:3.3.0-slim

# 本番用パッケージ
RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libvips \
    curl \
    git \
    libsqlite3-dev \
    nodejs \
    sqlite3 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# 本番用の設定
ENV RAILS_ENV=production
ENV BUNDLE_WITHOUT=development:test
ENV RAILS_LOG_TO_STDOUT=true
ENV RAILS_SERVE_STATIC_FILES=true

# Gemfileをコピーして依存関係をインストール
COPY Gemfile* ./
RUN bundle config set --local deployment 'true' && \
    bundle config set --local without 'development test' && \
    bundle install

# アプリケーションコードをコピー
COPY . .

# アセットプリコンパイル（本番用）
RUN SECRET_KEY_BASE=dummy bundle exec rails assets:precompile

# 起動スクリプトに実行権限
RUN chmod +x bin/rails
RUN chmod +x bin/docker-entrypoint

# エントリーポイントを設定
ENTRYPOINT ["bin/docker-entrypoint"]

EXPOSE 3000
CMD ["bin/rails", "server", "-b", "0.0.0.0"]