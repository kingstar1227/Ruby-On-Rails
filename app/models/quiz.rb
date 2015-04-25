class Quiz < ActiveRecord::Base
  has_many :questions
  belongs_to :unit

  def fetchQuestions()
    unit = Unit.find(self.unit_id)

    unit.vocables.each do |voc|
      quest = Question.where(vocable_id: voc.id).first
      unless(quest)
        quest = Question.generate(vocable: voc)
      end
      self.questions << quest
    end
    self.save
  end

end
