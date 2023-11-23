class Quiz < ApplicationRecord
  has_many :quiz_attempts
  belongs_to :category

  validates :sentence_japanese, presence: true
  validates :sentence_english, presence: true
end
