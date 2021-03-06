FROM ruby:2.3-slim

RUN apt-get update -qq && apt-get install -qq -y --no-install-recommends \
    build-essential \
    imagemagick \
    libpq-dev \
    nodejs
ENV APP_DIR /var/app
RUN mkdir -p $APP_DIR
WORKDIR $APP_DIR
COPY Gemfile* ./
RUN bundle config --global jobs 8
RUN bundle install --system
COPY . .
# RUN bundle exec rails RAILS_ENV=production DATABASE_URL=postgresql://user:pass@127.0.0.1/dbname ACTION_CABLE_ALLOWED_REQUEST_ORIGINS=foo,bar SECRET_TOKEN=dummytoken assets:precompile
VOLUME ["$APP_DIR/public"]
CMD bundle exec rails s