class Vocable < ActiveRecord::Base
  belongs_to :unit
  has_many :questions
end
