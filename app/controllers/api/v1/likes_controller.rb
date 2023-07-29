class Api::V1::LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    post = Post.find(params[:post_id])
    like = current_user.likes.new(post_id: post.id)
    if like.save
      post.create_notification_like!(current_user)#通知作成メソッドの呼び出し
      render json: { message: 'Liked successfully', liked: true }, status: 201
    else
      render json: { error: 'Failed to like' }, status: 500
    end
  end

  def destroy
    post = Post.find(params[:post_id])
    like = current_user.likes.find_by(post_id: post.id)
    if like.destroy
      render json: { message: 'Unliked successfully', liked: false }, status: 200
    else
      render json: { error: 'Failed to unlike' }, status: 500
    end
  end
end