class Api::V1::ArticleReadingsController < ApplicationController
  def create
    @article_reading = current_user.article_readings.new(article_reading_params)
    if @article_reading.save
      current_user.points += 10
      current_user.save!

      update_level(current_user)
      render json: { message: 'Article read recorded successfully' }, status: :created
    else
      render json: { errors: @article_reading.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def article_reading_params
    params.require(:article_reading).permit(:article_id, :read)
  end

  def update_level(user)
    level_thresholds = [100,200,300,400,500,600,700,800,900,1000]
    level_thresholds.each_with_index do |threshold, index|
      if user.points >= threshold && user.level == index
        user.update!(level: index + 1)
      end
    end
  end
end