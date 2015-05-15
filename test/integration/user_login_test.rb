require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest
  setup do
    @password = "testtest"
    @user = User.create!(email:"test@test.de", password: @password, password_confirmation: @password)
  end


  test "user can login and get redirected to personal Dashboard" do
    visit "/"
    click_link("Login")
    fill_in "Email", with: @user.email
    fill_in "Password", with: @password
    click_button("Log in")

    assert_equal "/", current_path
    within("h1") do
      assert has_content?("Select a Unit"), "No unit listed"
    end
  end

end
