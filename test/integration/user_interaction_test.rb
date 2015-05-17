require 'test_helper'

class UserInteractionTest < ActionDispatch::IntegrationTest
  setup do
    @password = "testtest"
    @user = User.create!(email:"test@test.de", password: @password, password_confirmation: @password)
    @unit = Unit.create!(name:"test")
    @unit_subscription = UnitSubscription.create!(user: @user,unit: @unit)
  end


  test "user can login and get redirected to Unitselection" do
    sign_in_as(@user,@password)

    #Assertions
    assert_equal "/", current_path

    within("h2") do
      assert has_content?("Welcome"), "No greeting listed"
    end
  end

  test "user can get dashbaord and url doesn't show the user_id" do
    sign_in_as(@user,@password)
    click_link "Dashboard"
    assert_no_match /#{@user.id}/, current_path,  "Dashboard path should't show user_id"
  end

  test "user can create unit_subscription" do
    sign_in_as(@user,@password)
    click_link("Add a new Unit")
    within("h1") do
      assert has_content?("Select a Unit"), "No selection message listed"
    end
    first('form').click_button("Learn")
    assert_match /unit_subscriptions/, current_path
  end

  test "user can create a new quiz" do
    sign_in_as(@user,@password)
    first('form').click_button("Test")
    assert_contains current_path, /quiz/
    within("h1") do
      assert has_content?("Quiz")
    end
  end

end
