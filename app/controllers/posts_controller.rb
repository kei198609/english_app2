class PostsController < ApplicationController
before_action :authenticate_user!

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

  def destroy
  end

  private

    def post_params
      params.require(:post).permit(:content, :content_japanese, :content_english, :subject_japanese, :subject_english)
    end


end
