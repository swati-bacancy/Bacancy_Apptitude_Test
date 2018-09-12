class Test < ApplicationRecord
  has_and_belongs_to_many :questions, dependent: :destroy
  has_many :students, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :student_answers, dependent: :destroy

  validates :name,:total_time, presence: true

  scope :technical, -> { where(is_technical: true) }
  scope :non_technical, -> { where(is_technical: false) }
end
