class Category < ApplicationRecord
  has_many :quizzes
  has_many :articles
end
