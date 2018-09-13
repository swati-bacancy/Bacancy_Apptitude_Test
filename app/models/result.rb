class Result < ApplicationRecord
  belongs_to :student
  belongs_to :test

  def self.to_csv(options = {})
    desired_columns = %w(student_enroll_number student_name student_email course collage_name total_questions attempted_questions correct_answer)
    CSV.generate(options) do |csv|
      csv << desired_columns
      all.each do |result|
        attributes = result.attributes
        attributes["student_enroll_number"] = result.student.roll_number
        attributes["student_name"] = result.student.name
        attributes["student_email"] = result.student.email
        attributes["course"] = result.student.course
        attributes["collage_name"] = result.student.collage_name
        csv << attributes.values_at(*desired_columns)
      end
    end
  end

  default_scope { order(correct_answer: :desc) }
end
