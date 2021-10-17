# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '6.1.4.1'
# Use postgresql as the database for Active Record
gem 'pg', '1.2.0'
# Use Puma as the app server
gem 'puma', '5.5.1'
# Use SCSS for stylesheets
gem 'sass-rails', '5.1.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '4.2.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '4.2.2'
# Minimal, modern embedded V8 for Ruby.
gem 'mini_racer', '0.4.0'
# Use Webpack to manage app-like JavaScript modules in Rails
gem 'webpacker', '4.2.2'
# React-Rails is a flexible tool to use React with Rails
gem 'react-rails', '2.6.1'
# Use jquery as the JavaScript library
gem 'jquery-rails', '4.4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '5.2.1'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '2.9.1'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Haml-rails provides Haml generators for Rails
gem 'haml-rails', '2.0.0'
# The most popular HTML, CSS, and JavaScript framework for developing responsive, mobile first projects on the web.
gem 'bootstrap', '5.1.0'
# Devise is a flexible authentication solution for Rails based on Warden
gem 'devise', '4.7.1'
# This gem provides a simple and extremely flexible way to upload files from Ruby applications
gem 'carrierwave', '2.2.2'
# Rails forms made easy.
gem 'simple_form', '5.0.1'
# RMagick is an interface between the Ruby programming language and the ImageMagick image processing library
gem 'rmagick', '4.0.0'
# will_paginate is a pagination library that integrates with Ruby on Rails
gem 'will_paginate', '3.1.8'
# Background jobs provider
gem 'sidekiq', '5.2.0'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', '11.0.1', platform: :mri
  # Brakeman is a static analysis tool which checks Ruby on Rails applications for security vulnerabilities.
  gem 'brakeman', '5.1.1'
  # Patch-level verification for bundler
  gem 'bundler-audit', '0.7.0.1'
  # Pry is a runtime developer console and IRB alternative with powerful introspection capabilities
  gem 'pry', '0.12.2'
  # rspec-rails brings the RSpec testing framework to Ruby on Rails as a drop-in alternative to Minitest.
  gem 'rspec-rails', '4.0.2'
  # RuboCop is a Ruby static code analyzer
  gem 'rubocop', '~> 1.20'
  # Performance optimization analysis for your projects, as an extension to RuboCop.
  gem 'rubocop-performance', '~> 1.11', '>= 1.11.5'
  # RSpec-specific analysis for your projects, as an extension to RuboCop.
  gem 'rubocop-rspec', '1.37.0'
  # SimpleCov is a code coverage analysis tool for Ruby
  gem 'simplecov', '0.18.5'
  # Library for stubbing and setting expectations on HTTP requests in Ruby.
  gem 'webmock', '~> 3.9', '>= 3.9.3'
end

group :development do
  # Preview email in the default browser instead of sending it
  gem 'letter_opener', '1.7.0'
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '4.0.1'
  # The listen gem listens to file modifications and notifies you about the changes.
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring', '2.1.0'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', '2.0.4', platforms: %i[mingw mswin x64_mingw jruby]
