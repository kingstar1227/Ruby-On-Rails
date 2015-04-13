class Unit < ActiveRecord::Base
   has_many :vocable
   has_many :quizzes
end
