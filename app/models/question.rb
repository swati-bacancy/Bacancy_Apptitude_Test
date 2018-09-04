class Question < ApplicationRecord
	has_many :options, dependent: :destroy
  has_one :answer, dependent: :destroy
  has_and_belongs_to_many :tests, dependent: :destroy
  has_many :student_answers, dependent: :destroy
  accepts_nested_attributes_for :options, :allow_destroy => true

  validates :question_description, presence: true
end
