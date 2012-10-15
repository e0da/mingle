require 'spork'

def spork?
  ENV['DRB']
end

def set_up_simplecov
  require 'simplecov'
  SimpleCov.start 'rails'
end

def set_up_rspec
  set_up_simplecov unless spork?

  ENV["RAILS_ENV"] ||= 'test'

  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'rspec/autorun'

  require 'capybara/rspec'
  require 'capybara/rails'


  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  RSpec.configure do |config|
    config.fixture_path = "#{::Rails.root}/spec/fixtures"
    config.use_transactional_fixtures = true
    config.infer_base_class_for_anonymous_controllers = true
    config.order = "random"
  end
end

def set_up_spork
  Spork.prefork  { set_up_rspec }
  Spork.each_run { set_up_simplecov }
end

if spork?
  set_up_spork
else
  set_up_rspec
end
