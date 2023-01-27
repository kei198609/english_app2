class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.page(params[:page]).per(5)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).per(5)
  end
end
