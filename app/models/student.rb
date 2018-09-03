class Student < ApplicationRecord
  belongs_to :test
  has_many :student_answers
  has_one :result

  validates :name,:course,:roll_number,:collage_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :mobile_number, presence: true, numericality: { only_integer: true }

end
