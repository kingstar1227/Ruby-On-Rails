require 'test_helper'

class QuestionsControllerTest < ActionController::TestCase
  setup do
    @vocable = Vocable.create!(english: "Test", german: "Test", swedish: "Test")
    @quest = Question.create()
  end

  test "should show Question" do
    get :show, id: @quest.id
    assert_response :success
  end

  test "aefwt" do

  assert_equal "Test", @vocable.english
  end

  test "should create Questions" do
    assert_difference('Question.count') do
      post :create, vocable:  {id: @vocable.id}
    end

  end
end
