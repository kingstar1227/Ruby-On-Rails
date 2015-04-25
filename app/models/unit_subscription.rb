class UnitSubscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :unit
  has_many :quizzes
end
