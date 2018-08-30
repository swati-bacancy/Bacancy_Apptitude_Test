class Student < ApplicationRecord
  belongs_to :test
  has_many :student_answers
end
