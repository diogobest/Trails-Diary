FROM ruby:2.6.4
RUN apt-get update -qq && apt-get install -y yarn nodejs postgresql-client
RUN mkdir /trails-diary
WORKDIR /trails-diary
COPY Gemfile /trails-diary/Gemfile
COPY Gemfile.lock /trails-diary/Gemfile.lock
RUN bundle install
COPY . /trails-diary

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
