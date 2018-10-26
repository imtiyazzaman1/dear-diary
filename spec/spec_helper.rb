ENV['ENVIRONMENT'] = 'test'

require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'setup_test_database'
require 'simplecov'
require 'simplecov-console'
require './app'

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
