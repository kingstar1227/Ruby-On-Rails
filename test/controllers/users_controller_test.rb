require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  setup do
    @unit = Unit.create!(name: 'Integration_test')
    @user = User.create!(email: "test2@test.de", password: "testtest", password_confirmation: "testtest")
    @unit_subscription = UnitSubscription.create(unit_id: @unit.id, user_id: @user.id)
  end

  test "get user page for current_user" do
    sign_in @user
    get(:show, id: @user.id)
    assert_equal 200, response.status
  end

  test "Do not get user page for not logged in user" do
    sign_out @user
    get(:show, id: @user.id)
    assert_equal 302, response.status #redirect to login
  end

end
