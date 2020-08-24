FROM ruby:2.7 AS nodejs

WORKDIR /tmp

RUN curl -LO https://nodejs.org/download/release/v14.8.0/node-v14.8.0-linux-x64.tar.xz
RUN tar xvf node-v14.8.0-linux-x64.tar.xz
RUN mv node-v14.8.0-linux-x64 node

FROM ruby:2.7

COPY --from=nodejs /tmp/node /opt/node
ENV PATH /opt/node/bin:$PATH

RUN useradd -m -u 1000 rails

RUN mkdir /app && chown rails /app
USER rails

RUN curl -o- -L https://yarnpkg.com/install.sh | bash

ENV PATH /home/rails/.yarn/bin:/home/rails/.config/yarn/global/node_modules/.bin:$PATH

RUN gem install bundler

WORKDIR /app

ADD --chown=rails Gemfile /app/

RUN bundle install
RUN yarn install

ADD --chown=rails . /app

CMD ["rails", "s", "-b", "0.0.0.0"]
