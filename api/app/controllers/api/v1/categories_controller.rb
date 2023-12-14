class Api::V1::CategoriesController < ApplicationController
  before_action :authenticate_user!
  def index
    @categories = Category.includes(:quizzes).all
    render json: @categories, include: :quizzes
  end
end