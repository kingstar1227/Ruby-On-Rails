require 'test_helper'

class UnitSubscriptionsControllerTest < ActionController::TestCase
  setup do
    @unit = Unit.create!(name: 'Integration_test')
    @user = User.create!(email: "test@test.de", password: "testtest", password_confirmation: "testtest")
    @unit_subscription = UnitSubscription.create(unit_id: @unit.id, user_id: @user.id)
  end

  test 'creates unit_subscription with valid data' do
    post :create, { score: 1, unit_id: 1, user_id: 1}
    assert_equal 302, response.status
  end

  test 'shows unit_subscription' do
    get :show, id: @unit_subscription.id
    assert_equal 200, response.status
  end

end
