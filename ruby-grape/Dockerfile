FROM ruby:2.6.5-alpine
WORKDIR /app
COPY . .
RUN apk --no-cache --quiet add build-base && \
      gem install --quiet bundler -v=2.1.4 && \
      bundle --quiet -j 2 && \
    apk --quiet del build-base
ENV RACK_ENV=production
CMD rackup --port 8000 --host 0.0.0.0 --env $RACK_ENV
