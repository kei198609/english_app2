class Api::V1::PostsController < ApplicationController
before_action :authenticate_user!
before_action :correct_user, only: :destroy

  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @posts = @user.posts
    else
      @posts = Post.all
    end
    render json: {
      posts: @posts.as_json(include: { user: { only: [:avatar, :name] } }, methods: :likes_count)
    }
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      # flash[:notice] = "投稿しました！" 削除予定
      render json: @post, staus: :created
    else
      # @feed_items = current_user.feed.page(params[:page]).per(5)　削除予定
      render json: { errors: @post.errors.full_messages }, status: :unprocessable_entity
      #rails7はstatus: :unprocessable_entityが必須みたい
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
    @comment = Comment.new
    @comments = @post.comments.page(params[:page]).per(5).reverse_order


    project_id = ENV["CLOUD_PROJECT_ID"]
    translate = Google::Cloud::Translate.new version: :v2, project_id: project_id
    target = "ja"
    @translation_subject = translate.translate @post.subject_english, to: target
    @translation_content = translate.translate @post.content_english, to: target

    render json: {
      post: @post,
      translation_subject: @translation_subject,
      translation_content: @translation_content,
      comments: @comments,
      liked: current_user.likes.exists?(post_id: @post.id),
      bookmarked: current_user.bookmarks.exists?(post_id: @post.id),
    }

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
