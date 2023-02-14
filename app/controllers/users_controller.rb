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

  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.page(params[:page]).per(5)
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.page(params[:page]).per(5)
    render 'show_follow'
  end


  # private
  #   def correct_user
  #     @user = User.find(params[:id])
  #     redirect_to(root_path) unless @user == current_user
  #   end
end
