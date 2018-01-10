class GeneralDirection < ApplicationRecord
  #belongs_to :direction
  #belongs_to :department
  #has_many :departments
  has_many :directions
  validates :name, presence: true, uniqueness: true
end
