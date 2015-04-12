require 'test_helper'

class QuizzesControllerTest < ActionController::TestCase

setup do
  @unit = Unit.create!(name: "QuizzesControllerTest")
end

test "Should create Quiz for unit" do
  assert_difference('Quiz.count') do
    post :create, unit: {id: @unit.id}
  end
end

end
