require 'test_helper'

class VocablesControllerTest < ActionController::TestCase
  setup do
    @unit = Unit.create!(name: 'test')
  end

  test "should create vocable with valid data" do
    assert_difference('Vocable.count') do
      post :create, vocable: {german: 'test', swedish: 'test', english: 'test'}, format: 'json'
    end
    assert_response :success
  end

  test "should destroy vocable" do
    @vocable = Vocable.create!(english: "test", german: "test2", swedish: "Test3")
    assert_difference('Vocable.count', -1) do
      delete :destroy, id: @vocable
    end
  end

end
