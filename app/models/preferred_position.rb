class PreferredPosition < ApplicationRecord
  has_many :students, dependent: :destroy
end
