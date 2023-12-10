class Api::V1::NotificationsController < ApplicationController
  before_action :authenticate_user!
  def index
    @notifications = current_user.passive_notifications.page(params[:page]).per(10)
    render json: @notifications.as_json(
      include: [
        :visitor,
        :visited,
        { post: { include: :user } }
      ]
    )
  end
end