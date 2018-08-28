class Question < ApplicationRecord
  has_many :options
  has_one :answer
  has_and_belongs_to_many :tests
end
