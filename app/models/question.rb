class Question < ActiveRecord::Base
  belongs_to :vocable
  belongs_to :quiz

  def self.generate(params)
    quest = self.create(params)
    if rand(10) < 5 
      quest.question = "What means #{quest.vocable.english} in Swedish?"
      quest.answer = quest.vocable.swedish
    else
      quest.question = "What means #{quest.vocable.swedish} in English?"
      quest.answer = quest.vocable.english
    end

    quest.save
    return quest
  end
end
