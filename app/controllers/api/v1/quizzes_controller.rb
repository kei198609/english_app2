class Api::V1::QuizzesController < ApplicationController
  def index
    # @quizzes = Quiz.all
    @quizzes = Quiz.includes(:category).all
    # render json: @quizzes
    render json: @quizzes, include: :category
  end

  def show
    @quiz = Quiz.find(params[:id])
    # render json: @quiz
    render json: @quiz, include: :category
  end
end
