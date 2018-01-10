class City < ApplicationRecord
	belongs_to :state
	has_one :addresses

	accepts_nested_attributes_for :state
end
