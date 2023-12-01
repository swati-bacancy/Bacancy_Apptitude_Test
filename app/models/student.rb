class Student < ApplicationRecord
  belongs_to :test
  has_many :student_answers, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :results, dependent: :destroy
  belongs_to :preferred_position, optional: true

  validates :collage_name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})\z/ }
  validates :roll_number, presence: true
  validates :name, presence: true, format: { with: /\A[a-zA-Z .]+\z/ }, length: { maximum: 50, :message => "Must be less than 50 characters"}

  after_initialize do |student|
    if !student.preferred_position.present?
      # preferred_position = PreferredPosition.where(tech: true, non_tech: true)&.first
      # student.preferred_position = preferred_position
    end
  end
end
