class Department < ApplicationRecord
  belongs_to :direction
  #belongs_to :general_direction
  has_many :functions
  validates :name, presence: true, uniqueness: true
end
