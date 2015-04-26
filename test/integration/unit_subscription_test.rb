require 'test_helper'

class UserUnitSubscriptionTest < ActionDispatch::IntegrationTest
  setup do

    @unit = Unit.create!(name: 'Integration_test')
    @user = User.create!(email: "test@test.de", password: "testtest", password_confirmation: "testtest")
    @unit_subscription = UnitSubscription.create(unit_id: @unit.id, user_id: @user.id)
  end

  test 'creates unit_subscription with valid data' do
    post '/unit_subscriptions', { score: 1, unit_id: 1, user_id: 1}.to_json, {
      'Accept' => 'application/javascript',
      'Content-Type' => 'application/json'
    }

    assert_equal 302, response.status

  end

  test 'shows unit_subscription' do
    get "/unit_subscriptions/#{@unit_subscription.id}"

    assert_equal 200, response.status
    #assert_not_nil assigns(@unit_subscription)
  end

end
