class Api::V1::QuizzesController < ApplicationController
  before_action :authenticate_user!
  def index
    @quizzes = Quiz.includes(:category).page(params[:page]).per(3)
    render json: {
      quizzes: @quizzes.as_json(include: :category),
      total_pages: @quizzes.total_pages,
      current_page: @quizzes.current_page
    }
  end

  def show
    @quiz = Quiz.find(params[:id])
    render json: @quiz, include: :category
  end
end
