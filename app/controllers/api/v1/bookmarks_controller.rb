class Api::V1::BookmarksController < ApplicationController

  before_action :authenticate_user!   # ログイン中のユーザーのみに許可（未ログインなら、ログイン画面へ移動）

  def create
    @post = Post.find(params[:post_id])
    bookmark = @post.bookmarks.new(user_id: current_user.id)
    bookmark.save
    render json: {
      bookmarked: true,
      bookmark_id: bookmark.id
    }
  end

  def destroy
    @post = Post.find(params[:post_id])
    bookmark = @post.bookmarks.find_by(user_id: current_user.id)
    bookmark&.destroy
    render json: {
      bookmarked: false
    }
  end
end