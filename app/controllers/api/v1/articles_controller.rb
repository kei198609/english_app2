class Api::V1::ArticlesController < ApplicationController
  before_action :authenticate_user!
  def index
    @articles = Article.includes(:category).page(params[:page]).per(3)
    render json: {
      articles: @articles.as_json(include: :category),
      total_pages: @articles.total_pages,
      current_page: @articles.current_page
    }
  end

  def show
    @article = Article.includes(:category).find(params[:id])
    render json: @article, include: :category
  end
end
