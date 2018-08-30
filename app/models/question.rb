class Question < ApplicationRecord
	has_many :options, dependent: :destroy
  has_one :answer
  has_and_belongs_to_many :tests
  accepts_nested_attributes_for :options, :allow_destroy => true
end
