class TopsController < ApplicationController
  # 不要なコントローラー削除予定
  # def index
  #   if user_signed_in?
  #     @post = current_user.posts.build
  #     @q = Post.ransack(params[:q])
  #     if params[:q].present?
  #       @feed_items = @q.result(distinct: true).page(params[:page]).per(8)
  #     else
  #       @feed_items = current_user.feed.page(params[:page]).per(8)
  #     end
  #     occupation_posts = User.where(occupation: current_user.occupation).pluck(:id)
  #     @recommend_post = Post.where(user_id: occupation_posts).
  #                       where.not(user_id: current_user.id).
  #                       joins(:likes).
  #                       group(:id).
  #                       order('MAX(likes.created_at) DESC').first
  #   end
  # end
end