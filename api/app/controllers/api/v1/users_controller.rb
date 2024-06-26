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
    @data = @user.posts.group_by(&:genre).transform_values(&:count)
    followers_count = @user.followers.count
    following_count = @user.following.count

    render json: {
      user: @user,
      data: @data,
      followers_count: followers_count,
      following_count: following_count
    }
  end

  def following
    @title = t('.Following')
    @user  = User.find(params[:id])
    @users = @user.following.page(params[:page]).per(5)
    render json: {
      title: @title,
      users: @users,
      total_pages: @users.total_pages,
      current_page: @users.current_page
    }
  end

  def followers
    @title = t('.Followers')
    @user  = User.find(params[:id])
    @users = @user.followers.page(params[:page]).per(5)
    render json: {
      title: @title,
      users: @users,
      total_pages: @users.total_pages,
      current_page: @users.current_page
    }
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

  def bookmarks
    @bookmarks = current_user.bookmarks.page(params[:page]).per(5)
    bookmarks_json = @bookmarks.as_json(
      include: {
        post: { only: [:id, :content, :title, :genre],
          include: {
            user: {
              only: [:id, :name, :avatar]
            }
          }
        }
      }
    )
    render json: {
      bookmarks: bookmarks_json,
      total_pages: @bookmarks.total_pages,
      current_page: @bookmarks.current_page
    }
  end

  # ユーザーごとのクイズの正誤、未学習情報を取得するAPIエンドポイント
  def quiz_statistics
    user_id = params[:id]

    total_quizzes = Quiz.count
    attempted_quizzes = QuizAttempt.where(user_id: user_id).count
    correct_answers = QuizAttempt.where(user_id: user_id, correct: true).count

    unattempted = total_quizzes - attempted_quizzes
    incorrect = attempted_quizzes - correct_answers

    render json: {
      correct: correct_answers,
      incorrect: incorrect,
      unattempted: unattempted
    }
  end
  def article_statistics
    user_id = params[:id]

    total_articles = Article.count
    read_articles = ArticleReading.where(user_id: user_id).count
    unread_articles = total_articles - read_articles
    render json: {
      read: read_articles,
      unread: unread_articles
    }
  end
end