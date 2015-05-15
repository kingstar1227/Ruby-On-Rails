ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

class ActionController::TestCase
  include Devise::TestHelpers
end

class ActionDispatch::IntegrationTest
  # Make the Capybara DSL available in all integration tests
  include Capybara::DSL
  Capybara.reset_sessions!
  Capybara.use_default_driver

  def sign_up_as(user,password)
    visit "/"
    click_link("Login")
    fill_in "Email", with: user.email
    fill_in "Password", with: password
    click_link("Login")
  end

  def sign_out
    click_link("Log out")
  end

end
