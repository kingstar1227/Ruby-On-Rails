require 'test_helper'

class DeletingVocbalesTest < ActionDispatch::IntegrationTest
  setup do

    @vocable = Vocable.create!(english: "test", german: "test2", swedish: "Test3")

  end

  test 'destroy vocable with valid data' do
    delete "/vocables/#{@vocable.id}"
    assert_equal 204, response.status
  end


end
