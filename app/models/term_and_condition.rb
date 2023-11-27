class TermAndCondition < ApplicationRecord
  validates :content, presence: true
end
