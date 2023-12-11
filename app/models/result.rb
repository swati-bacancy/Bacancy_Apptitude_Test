class Result < ApplicationRecord
  belongs_to :student
  belongs_to :test

  def self.to_csv(options = {})
    desired_columns = %w(student_enroll_number student_name student_email course collage_name total_questions attempted_questions correct_answer technical_marks total_marks checked_by)
    CSV.generate(options) do |csv|
      # Convert underscored column names to CamelCase
      header_row = desired_columns.map { |column| column.split('_').map(&:capitalize).join('') }
      csv << header_row

      all.each do |result|
        attributes = result.attributes
        attributes["student_enroll_number"] = result.student.roll_number
        attributes["student_name"] = result.student.name
        attributes["student_email"] = result.student.email
        attributes["course"] = result.student.course
        attributes["collage_name"] = result.student.collage_name
        attributes["technical_marks"] = result.technical_marks
        attributes["total_marks"] = result.technical_marks.to_i + result.correct_answer.to_i
        attributes["checked_by"] = result.checked_by
        csv << attributes.values_at(*desired_columns)
      end
    end
  end

  default_scope { order(correct_answer: :desc) }
end
