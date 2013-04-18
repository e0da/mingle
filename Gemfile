source 'https://rubygems.org'

gem 'rails', '~> 3.2.12'

gem 'bcrypt-ruby'
gem 'pg'

gem 'jquery-rails'
gem 'slim'

group :assets do
  gem 'bootstrap-sass-rails'
  gem 'coffee-rails', '~> 3.2'
  gem 'font-awesome-sass-rails'
  gem 'sass-rails', '~> 3.2'
  gem 'therubyracer', :platforms => :ruby
  gem 'uglifier', '~> 1.0'
end

group :development, :test do
  gem 'capybara'
  gem 'guard-rails'
  gem 'guard-rspec'
  gem 'guard-spork'
  gem 'libnotify',  :require => RUBY_PLATFORM.include?('linux') && 'libnotify'
  gem 'terminal-notifier-guard' , :require => RUBY_PLATFORM.include?('darwin') && 'terminal-notifier-guard'
  gem 'rb-inotify', :require => false
  gem 'rb-fsevent', :require => false
  gem 'rspec'
  gem 'rspec-rails'
  gem 'simplecov'
  gem 'spork'
  gem 'sqlite3'
end
