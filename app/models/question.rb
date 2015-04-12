class Question < ActiveRecord::Base
  belongs_to :vocable
  belongs_to :quiz

  def self.generate(params)
    quest = self.create(params)
    quest.question = "What means #{quest.vocable.english} in Swedish?"
    quest.answer = quest.vocable.swedish

    quest.save
    return quest
  end
end
