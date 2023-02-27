class TopsController < ApplicationController
  # 検索機能に対応
  def index
    if user_signed_in?
      @post = current_user.posts.build
      if params[:content_english].present? || params[:scene].present?
        @feed_items = Post.search(params[:content_english], params[:scene]).page(params[:page]).per(8)
      else
        @feed_items = current_user.feed.page(params[:page]).per(8)
      end
    end
  end
end

# 旧
# class TopsController < ApplicationController
#   def index
#     if user_signed_in?
#       @post = current_user.posts.build
#       @feed_items = current_user.feed.page(params[:page]).per(5)
#     end
#   end
# end