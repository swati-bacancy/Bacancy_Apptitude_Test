class Student < ApplicationRecord
  belongs_to :test
  has_many :student_answers, dependent: :destroy
  has_many :results, dependent: :destroy

  validates :name,:course,:roll_number,:collage_name, presence: true
  validates :email, presence: true, uniqueness: true
end
