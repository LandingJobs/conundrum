source 'https://rubygems.org'
ruby '2.0.0'

gem 'rails', '4.0.1'

gem 'pg'

gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails', '~> 3.0.4'
gem 'bootstrap-sass', '~> 3.0.2.1'
gem 'font-awesome-sass-rails', '~> 3.0.2.2'
gem 'slim', '~> 2.0.2'
gem 'redcarpet'
gem 'pygmentize', github:'spiceworks/pygmentize'
gem 'turbolinks', '~> 1.3.0'
gem 'simple_form'
gem 'time_difference'
gem 'sucker_punch'
gem 'omniauth'
gem 'omniauth-github'

gem 'activeadmin', github: 'gregbell/active_admin'

group :production do
  gem 'rails_12factor'
  gem 'puma', '~> 2.6.0'
  gem 'newrelic_rpm'
end

group :development do
  gem 'quiet_assets'
  gem 'pry-rails'
  gem 'awesome_print'
  gem 'slim-rails'
  gem 'guard'
  gem 'guard-bundler'
  gem 'guard-rspec'
  gem 'guard-cucumber'
  gem 'guard-zeus'
  gem 'rb-inotify', :require => false
  gem 'rb-fsevent', :require => false
  gem 'mail_view'
end

group :test do
  gem 'cucumber-rails', require: false, github:'cucumber/cucumber-rails'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'ffaker'
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'simplecov', require:false
  gem 'zeus'
  gem 'timecop'
end

group :test, :development do
  gem 'rspec-rails'
  gem 'dotenv-rails'
  gem 'fabrication'
end