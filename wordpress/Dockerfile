FROM ruby:2.6.5-alpine3.10
# install geckodriver glib compartibility driver
RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
    wget -q https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.30-r0/glibc-2.30-r0.apk && \
    wget -q https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.30-r0/glibc-bin-2.30-r0.apk && \
    apk --no-cache --quiet add glibc-2.30-r0.apk && \
    apk --no-cache --quiet add glibc-bin-2.30-r0.apk        && \
# install geckodriver
    wget -q https://github.com/mozilla/geckodriver/releases/download/v0.25.0/geckodriver-v0.25.0-linux64.tar.gz && \
    tar -zxf geckodriver-v0.25.0-linux64.tar.gz -C /usr/bin && \
# install firefox
    apk --no-cache --quiet add firefox-esr=60.9.0-r0        && \
# install build=base
    apk --no-cache --quiet add build-base
WORKDIR /app
COPY Gemfile* ./
COPY spec ./spec/
RUN gem install --quiet bundler -v=2.1.4 && bundle --quiet --jobs 2 && \
# reduce the image size by deliting build-base package
    apk --quiet del build-base
