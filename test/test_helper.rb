require 'coveralls'
Coveralls.wear!

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/reporters'
Minitest::Reporters.use! [Minitest::Reporters::SpecReporter.new]

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  include Warden::Test::Helpers
  Warden.test_mode!
  # Add more helper methods to be used by all tests here...
end

require 'capybara/rails'
class ActionDispatch::IntegrationTest
  include Capybara::DSL
  def teardown
    Capybara.reset_sessions!
    Capybara.use_default_driver
    Warden.test_reset!
  end
end

require 'capybara/poltergeist'
Capybara.default_driver = :poltergeist

Capybara.register_driver :headless_chrome do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome('chromeOptions' => { args: %w(headless disable-gpu) })
  Capybara::Selenium::Driver.new app, browser: :chrome, desired_capabilities: capabilities
end
Capybara.save_path = Rails.root.join('tmp/capybara')
Capybara.javascript_driver = :headless_chrome