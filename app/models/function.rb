class Function < ApplicationRecord
  belongs_to :department
  belongs_to :labor
  validates :name, presence: true
  accepts_nested_attributes_for :department
end
