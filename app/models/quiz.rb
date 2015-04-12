class Quiz < ActiveRecord::Base
  has_many :questions

  def fetchQuestions()
    unit = Unit.find(self.unit_id)

    unit.vocable.each do |voc|
      self.questions << Question.generate(vocable: voc)
    end
    self.save
  end

end
