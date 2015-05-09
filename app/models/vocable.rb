class Vocable < ActiveRecord::Base
  belongs_to :unit
  has_many :questions
  validates_presence_of :swedish
  validates_presence_of :english  
end
