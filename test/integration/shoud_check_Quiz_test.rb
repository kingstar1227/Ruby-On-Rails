require 'test_helper'

class CreatingVocbalesTest < ActionDispatch::IntegrationTest
  setup do
    @quiz = Quiz.create()
  end

  test 'check quiz with valid data' do
    post '/quiz/check', { quiz_id: @quiz.id , answers: answers_send }.to_json, {
      'Content-Type' => 'application/json'
    }

    assert_equal 200, response.status
  end
  def answers_send
    {
      "1": "Test",
      "2": "Test"
    }
  end
end
