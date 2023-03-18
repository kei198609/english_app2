class BookmarksController < ApplicationController

  before_action :authenticate_user!   # ログイン中のユーザーのみに許可（未ログインなら、ログイン画面へ移動）

  def index
    @bookmarks = Bookmark.where(user_id: current_user.id)
  end

  # def create
  #   @post = Post.find(params[:post_id])
  #   bookmark = @post.bookmarks.new(user_id: current_user.id)
  #   respond_to do |format|
  #     if bookmark.save
  #       format.html { redirect_to request.referer }
  #       format.turbo_stream
  #     else
  #       format.html { redirect_to request.referer }
  #       format.turbo_stream
  #     end
  #   end
  # end
  def create
    @post = Post.find(params[:post_id])
    bookmark = @post.bookmarks.new(user_id: current_user.id)
    if bookmark.save
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  # def destroy
  #   @post = Post.find(params[:post_id])
  #   bookmark = @post.bookmarks.find_by(user_id: current_user.id)
  #   respond_to do |format|
  #     if bookmark.present?
  #       bookmark.destroy
  #       format.html { redirect_to request.referer }
  #       format.turbo_stream
  #     else
  #       format.html { redirect_to request.referer }
  #       format.turbo_stream
  #     end
  #   end
  # end
  def destroy
    @post = Post.find(params[:post_id])
    bookmark = @post.bookmarks.find_by(user_id: current_user.id)
    if bookmark.present?
        bookmark.destroy
        redirect_to request.referer
    else
        redirect_to request.referer
    end
  end
end
