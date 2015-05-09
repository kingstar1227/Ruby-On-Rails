require 'test_helper'

class QuizzesControllerTest < ActionController::TestCase

setup do
  @user = User.create!(email: "test4@test.de", password: "testtest", password_confirmation: "testtest")
  @unit = Unit.create!(name: "Test")
  @unit_subscription = UnitSubscription.create!(unit_id: @unit.id,  user_id: @user.id)
end

test "Should create Quiz for unit" do
  assert_difference('Quiz.count') do
    post :create, unit_subscription: {id: @unit_subscription.id}
  end
end

test 'should redirect a post to check without params' do
  post :check, content: { quiz_id: nil , quest_ids: nil}
  assert_equal 302, response.status
end
end
