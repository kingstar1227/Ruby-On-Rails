class Question < ActiveRecord::Base
  belongs_to :vocable
  belongs_to :quiz

  def self.generate(vocableId)
    quest = Question.new()

    vocable = Vocable.find(vocableId)

    quest.question = "What means #{vocable.english} in Swedish?"
    quest.answer = vocable.swedish

    quest.save

    return quest

  end
end
