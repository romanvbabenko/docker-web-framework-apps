FROM ruby:2.6.5

ARG NODE_MAJOR_VERSION=10
ARG YARN_VERSION=1.22.4
ARG GECKODRIVER_VERSION=0.25.0

RUN curl -sL https://deb.nodesource.com/setup_${NODE_MAJOR_VERSION}.x | bash -
RUN apt-get update && apt-get install -y build-essential nodejs
RUN curl -o- -sL https://yarnpkg.com/install.sh | bash -s -- --version ${YARN_VERSION}

RUN wget -q https://github.com/mozilla/geckodriver/releases/download/v${GECKODRIVER_VERSION}/geckodriver-v${GECKODRIVER_VERSION}-linux64.tar.gz && \
    tar -zxf geckodriver-v${GECKODRIVER_VERSION}-linux64.tar.gz -C /usr/bin
RUN apt-get -qqqy install firefox-esr

ENV HOME=/root
ENV PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
ENV GEM_HOME=/bundle
ENV BUNDLE_JOBS=4
ENV BUNDLE_RETRY=3
ENV BUNDLE_PATH $GEM_HOME
ENV BUNDLE_APP_CONFIG=$BUNDLE_PATH

ARG BUNDLER_VERSION=2.1.4
RUN gem update --quiet --system && gem install --quiet bundler:$BUNDLER_VERSION

WORKDIR /app

COPY . .
RUN cp config/database.yml.example config/database.yml
