class StudentAnswer < ApplicationRecord
  belongs_to :student
  belongs_to :question
  belongs_to :option
  belongs_to :test
end
