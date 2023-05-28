#!/usr/bin/env bash
# exit on error
set -o errexit

# the current version of Nokogiri ships with incompatible libs
bundle config --local build.nokogiri --use-system-libraries

bundle lock --add-platform x86_64-linux

bundle install
bundle exec rake assets:precompile
bundle exec rake assets:clean
bundle exec rake db:migrate