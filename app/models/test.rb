class Test < ApplicationRecord
  has_and_belongs_to_many :questions
  has_many :students

  validates :name,:total_time, presence: true
end
