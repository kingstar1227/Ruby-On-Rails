class Unit < ActiveRecord::Base
   has_many :vocables
   has_many :quizzes
   has_many :unit_subscritions
   validates :name, presence: true, length: {minimum: 3}
end
