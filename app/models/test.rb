class Test < ApplicationRecord
  has_and_belongs_to_many :questions, dependent: :destroy
  has_many :students, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :student_answers, dependent: :destroy

  validates :name, presence: true
end
