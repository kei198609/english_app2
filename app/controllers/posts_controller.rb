class PostsController < ApplicationController
before_action :authenticate_user!
before_action :correct_user, only: :destroy

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "投稿しました！"
      redirect_to new_post_path
    else
      @feed_items = current_user.feed.page(params[:page]).per(5)
      render 'new', status: :unprocessable_entity #rails7はstatus: :unprocessable_entityが必須みたい
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def destroy
    @post.destroy
    flash[:success] = "削除しました"
    redirect_to request.referrer || root_url
  end

  private

    def post_params
      params.require(:post).permit(:scene, :content, :content_japanese, :content_english, :subject_japanese, :subject_english)
    end

    def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to root_url if @post.nil?
    end
end
