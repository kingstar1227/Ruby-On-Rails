class Quiz < ActiveRecord::Base
  has_many :questions
  belongs_to :unit_subscription


  def fetchQuestions()
    unit = self.unit_subscription.unit

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
