class Api::V1::ArticlesController < ApplicationController
  def index
    @articles = Article.includes(:category).all
    render json: @articles, include: :category
  end

  def show
    @article = Article.includes(:category).find(params[:id])
    render json: @article, include: :category
  end
end
