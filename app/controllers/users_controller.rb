class UsersController < ApplicationController
  before_action :authenticate_user!
  # before_action :correct_user, only:[:show]

  def index
    @users = User.page(params[:page]).per(5)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).per(5)
  end

  # private
  #   def correct_user
  #     @user = User.find(params[:id])
  #     redirect_to(root_path) unless @user == current_user
  #   end
end
