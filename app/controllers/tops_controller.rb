class TopsController < ApplicationController
  # 検索機能に対応


  # def index
  #   if user_signed_in?
  #     @post = current_user.posts.build
  #     @q = Post.ransack(params[:q])
  #     if params[:q]
  #       @feed_items = @q.result(distinct: true).page(params[:page]).per(8)
  #     else
  #       @feed_items = current_user.feed.page(params[:page]).per(8)
  #     end
  #   end
  # end

  # def index
  #   if user_signed_in?
  #     @post = current_user.posts.build
  #     if params[:q].present?
  #       @q = Post.ransack(params[:q])
  #       @feed_items = @q.result(distinct: true).page(params[:page]).per(8)
  #     else
  #       @feed_items = current_user.feed.page(params[:page]).per(8)
  #     end
  #   end
  # end

  def index
    if user_signed_in?
      @post = current_user.posts.build
      @q = Post.ransack(params[:q])
      if params[:q].present?
        @feed_items = @q.result(distinct: true).page(params[:page]).per(8)
      else
        @feed_items = current_user.feed.page(params[:page]).per(8)
      end
    end
  end

  # def index
  #   if user_signed_in?
  #     @post = current_user.posts.build
  #     @q = Post.ransack(params[:q])
  #     if params[:q] && @q.result.present?
  #       @feed_items = @q.result(distinct: true).page(params[:page]).per(8)
  #     else
  #       @feed_items = current_user.feed.page(params[:page]).per(8)
  #     end
  #   end
  # end

end
