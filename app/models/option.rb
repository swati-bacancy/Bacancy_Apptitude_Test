class Option < ApplicationRecord
  belongs_to :question

  validates :option,:option_value, presence: true
end
