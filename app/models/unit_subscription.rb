class UnitSubscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :unit
  has_many :quizzes

  validates :unit_id , presence: true, uniqueness: {scope: :user_id}
  validates :user_id , presence: true
end
