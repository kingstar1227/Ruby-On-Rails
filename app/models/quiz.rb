class Quiz < ActiveRecord::Base
  has_many :questions
  belongs_to :unit

  def fetchQuestions()
    unit = Unit.find(self.unit_id)

    unit.vocable.each do |voc|
      self.questions << Question.generate(vocable: voc)
    end
    self.save
  end

end
