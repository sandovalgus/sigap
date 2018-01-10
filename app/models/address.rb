class Address < ApplicationRecord
  belongs_to :city
  has_one :state, through: :city
  has_one :country, through: :state
  belongs_to :employee

  accepts_nested_attributes_for :city, :state, :country
end
