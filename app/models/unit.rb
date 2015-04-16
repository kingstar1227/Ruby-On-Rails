class Unit < ActiveRecord::Base
   has_many :vocable
   has_many :quizzes
   validates :name, presence: true, length: {minimum: 3}
end
