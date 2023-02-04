class TopsController < ApplicationController
  def index
    if user_signed_in?
      @post = current_user.posts.build
      @feed_items = current_user.feed.page(params[:page]).per(5)
    end
  end
end
