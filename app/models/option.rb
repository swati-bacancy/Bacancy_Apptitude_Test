class Option < ApplicationRecord
  belongs_to :question
  has_many :student_answers, dependent: :destroy

  validates :option,:option_value, presence: true
end
