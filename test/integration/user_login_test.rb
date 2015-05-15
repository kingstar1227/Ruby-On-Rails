require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest
  setup do
    @password = "testtest"
    @user = User.create!(email:"test@test.de", password: @password, password_confirmation: @password)
  end


  test "user can login and get redirected to personal Dashboard" do
    sign_in_as(@user,@password)

    #Assertions
    assert_equal "/", current_path

    within("h1") do
      assert has_content?("Select a Unit"), "No unit listed"
    end
  end

end
