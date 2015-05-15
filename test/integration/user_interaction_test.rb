require 'test_helper'

class UserInteractionTest < ActionDispatch::IntegrationTest
  setup do
    @password = "testtest"
    @user = User.create!(email:"test@test.de", password: @password, password_confirmation: @password)
    @unit = Unit.create!(name:"test")
  end


  test "user can login and get redirected to Unitselectio" do
    sign_in_as(@user,@password)

    #Assertions
    assert_equal "/", current_path

    within("h2") do
      assert has_content?("Welcome"), "No greeting listed"
    end
  end

end
