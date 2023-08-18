class Quiz < ApplicationRecord
  has_many :quiz_attempts
  belongs_to :category
end
