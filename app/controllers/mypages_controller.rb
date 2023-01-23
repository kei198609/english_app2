class MypagesController < ApplicationController
  def show
    @user = User.find(params[:id])
    # @user = User.page(params[:page]).per(5)
    @posts = @user.posts.page(params[:page]).per(5)
  end
end
