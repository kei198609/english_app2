class PostsController < ApplicationController
before_action :authenticate_user!
before_action :correct_user, only: :destroy

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:notice] = "投稿しました！"
      redirect_to new_post_path
    else
      @feed_items = current_user.feed.page(params[:page]).per(5)
      render 'new', status: :unprocessable_entity #rails7はstatus: :unprocessable_entityが必須みたい
    end
  end

  def show
    @post = Post.find_by(id: params[:id])

    project_id = ENV["CLOUD_PROJECT_ID"]
    translate = Google::Cloud::Translate.new version: :v2, project_id: project_id
    target = "ja"
    @translation_subject = translate.translate @post.subject_english, to: target
    @translation_content = translate.translate @post.content_english, to: target

  end

  def destroy
    @post.destroy
    flash[:notice] = "削除しました。"
    redirect_to request.referrer || root_url
  end

  private

    def post_params
      params.require(:post).permit(:scene, :content_english, :subject_english)
    end

    def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to root_url if @post.nil?
    end
end
