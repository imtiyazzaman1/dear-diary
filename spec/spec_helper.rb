require './app'
require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'setup_test_database'
require 'simplecov'
require 'simplecov-console'

ENV['ENVIRONMENT'] = 'test'

Capybara.app = Diary

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new(
  SimpleCov::Formatter::Console
)
SimpleCov.start

RSpec.configure do |config|
  config.before(:each) do
    setup_test_database
  end
end
