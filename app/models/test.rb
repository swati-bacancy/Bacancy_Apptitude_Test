class Test < ApplicationRecord
  belongs_to :student
  has_and_belongs_to_many :questions
end
