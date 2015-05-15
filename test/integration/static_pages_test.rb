require 'test_helper'

class StaticPagesTest < ActionDispatch::IntegrationTest

  test "get the home page" do
    visit("/")
    within("h1") do
      assert has_content?('Your personal swedish vocabulary app')
    end
  end

  test "get the help page" do
    visit("/static_pages/help")
    within("h1") do
      assert has_content?('Help')
    end
  end

end
