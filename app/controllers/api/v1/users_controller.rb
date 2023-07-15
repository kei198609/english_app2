class Api::V1::UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.page(params[:page]).per(5)
    render json: {
      users: @users,
      total_pages: @users.total_pages,
      current_page: @users.current_page
    }
  end

  def show
    @user = User.find(params[:id])
    # @posts = @user.posts.page(params[:page]).per(5)
    @data = @user.posts.group_by(&:scene).transform_values(&:count)
    followers_count = @user.followers.count
    following_count = @user.following.count

    # bookmarks = Bookmark.where(user_id: current_user.id).pluck(:post_id)  # ログイン中のユーザーのブックマークのpost_idカラムを取得
    # @bookmark_list = Post.find(bookmarks)     # postsテーブルから、お気に入り登録済みのレコードを取得
    render json: {
      user: @user,
      # posts: @posts,
      data: @data,
      # bookmark_list: @bookmark_list
      followers_count: followers_count,
      following_count: following_count
    }
  end

  def following
    @title = t('.Following')
    @user  = User.find(params[:id])
    @users = @user.following.page(params[:page]).per(5)
    render json: { title: @title, users: @users }
  end

  def followers
    @title = t('.Followers')
    @user  = User.find(params[:id])
    @users = @user.followers.page(params[:page]).per(5)
    render json: { title: @title, users: @users }
  end

# nuxt側フォロー、アンフォロー機能用
  def following_status
    @user = User.find(params[:id])
    is_following = current_user.following?(@user)
    render json: { following: is_following }
  end

  def follow
    @user = User.find(params[:id])
    current_user.follow(@user)
    head :no_content
  end

  def unfollow
    @user = User.find(params[:id])
    current_user.unfollow(@user)
    head :no_content
  end

  def update_avatar
    @user = User.find(params[:id])
    if @user.update(avatar: params[:user][:avatar])
      render json: { avatar_url: @user.avatar.url }
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end
end