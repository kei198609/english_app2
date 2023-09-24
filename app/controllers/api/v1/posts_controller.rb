class Api::V1::PostsController < ApplicationController
before_action :authenticate_user!
before_action :correct_user, only: :destroy

  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @posts = @user.posts
    elsif params[:query].present?
      @posts = Post.where('subject_english LIKE ? OR content_english LIKE ?', "%#{params[:query]}%", "%#{params[:query]}%")
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
      render json: @post, staus: :created
    else
      render json: { errors: @post.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
    @comment = Comment.new
    @comments = @post.comments.page(params[:page]).per(5).reverse_order.map do |comment|
      comment.attributes.merge(user_name: comment.user.name)
    end
    render json: {
      post: @post,
      comments: @comments,
      liked: current_user.likes.exists?(post_id: @post.id),
      bookmarked: current_user.bookmarks.exists?(post_id: @post.id),
    }

  end

  def destroy
    @post.destroy
    render json: { status: 'success' }
  end

  private

    def post_params
      params.require(:post).permit(:title, :content, :genre)
    end

    def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to root_url if @post.nil?
    end
end
