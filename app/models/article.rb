class Article < ApplicationRecord
  belongs_to :category
  has_many :article_readings
  has_many :users, through: :article_readings
end
