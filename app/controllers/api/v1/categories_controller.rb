class Api::V1::CategoriesController < ApplicationController
  def index
    @categories = Category.includes(:quizzes).all
    render json: @categories, include: :quizzes
  end
end
