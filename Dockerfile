FROM ruby:2.4.3

# RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN apt-get update -qq
RUN apt-get install -y build-essential 
RUN apt-get install -y libpq-dev
RUN apt-get install -y nodejs

# ワーキングディレクトリの設定
RUN mkdir /api_server
WORKDIR /api_server

# gemfileを追加する
ADD Gemfile /api_server/Gemfile
ADD Gemfile.lock /api_server/Gemfile.lock

# gemfileのinstall
RUN bundle install
ADD . /api_server
