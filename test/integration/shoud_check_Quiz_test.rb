require 'test_helper'

class CreatingVocbalesTest < ActionDispatch::IntegrationTest
  setup do
    @unit = Unit.create(name: "TestUnIt")
    @vocable = Vocable.create(english: 'test', swedish: 'test', german: 'test')
    @unit.vocable << @vocable
    @quest = Question.generate(vocable: @vocable)
    @quiz = Quiz.create()
    @quiz.questions << @quest
    @quiz.unit_id = @unit.id
  end

  test 'check quiz without params redirected' do
    post '/quiz/check', {content: { quiz_id: nil , quest_ids: nil}}.to_json, {
      'Content-Type' => 'application/json'
    }

    assert_equal 302, response.status
  end


end
