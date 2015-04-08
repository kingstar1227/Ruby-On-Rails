require 'test_helper'

class CreatingVocbalesTest < ActionDispatch::IntegrationTest
  setup do
    @unit = Unit.create!(name: 'Integration_test')
  end

  test 'creates vocable with valid data' do
    post '/vocables', { vocable: vocable_attributes }.to_json, {
      'Accept' => 'application/javascript',
      'Content-Type' => 'application/json'
    }

    assert_equal 200, response.status
  end
  def vocable_attributes
    {
      german: 'Hallo test',
      english: 'Hallo Test',
      swedish: 'Hallo test'
    }
  end
end
