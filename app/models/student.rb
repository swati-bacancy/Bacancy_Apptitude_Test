class Student < ApplicationRecord
  belongs_to :test
  has_many :student_answers, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :results, dependent: :destroy
  belongs_to :preferred_position

  validates :course,:collage_name,:url, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})\z/ }
  validates :roll_number, :location, presence: true
  validates :name, presence: true, format: { with: /\A[a-zA-Z .]+\z/ }, length: { maximum: 50, :message => "Must be less than 50 characters"}
end
