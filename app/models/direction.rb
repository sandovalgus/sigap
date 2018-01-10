class Direction < ApplicationRecord
	belongs_to :general_direction
	has_many :departments
	validates :name, presence: true, uniqueness: true
end
