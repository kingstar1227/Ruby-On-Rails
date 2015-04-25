require 'test_helper'

class CreatingVocablesTest < ActionDispatch::IntegrationTest
  setup do
  end

  test 'check quiz without params redirected' do
    post '/quiz/check', {content: { quiz_id: nil , quest_ids: nil}}.to_json, {
      'Content-Type' => 'application/json'
    }

    assert_equal 302, response.status
  end


end
