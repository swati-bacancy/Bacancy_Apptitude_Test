class Result < ApplicationRecord
  belongs_to :student
  belongs_to :test

  def self.to_csv(options = {})
    desired_columns = %w(id student_name student_email course collage_name mobile_number total_questions attempted_questions correct_answer)
    CSV.generate(options) do |csv|
      csv << desired_columns
      all.each do |result|
        attributes = result.attributes
        attributes["student_name"] = result.student.name
        attributes["student_email"] = result.student.email
        attributes["course"] = result.student.course
        attributes["collage_name"] = result.student.collage_name
        attributes["mobile_number"] = result.student.mobile_number
        csv << attributes.values_at(*desired_columns)
      end
    end
  end
end
