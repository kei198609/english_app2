class Api::V1::QuizAttemptsController < ApplicationController
  before_action :authenticate_user!

  def index
    @quiz_attempts = QuizAttempt.where(user_id: current_user.id)
    render json: @quiz_attempts
  end

  def create
    previous_attempt = QuizAttempt.find_by(user_id: current_user.id, quiz_id: quiz_attempt_params[:quiz_id])

    correct_answer_array = JSON.parse(Quiz.find(quiz_attempt_params[:quiz_id]).sentence_english)
    correct_answer_string = correct_answer_array.join(' ')

    if previous_attempt
      # 既存の試行が正解の場合
      if previous_attempt.correct
        render json: { message: 'Already answered correctly.' }, status: :unprocessable_entity
        return
      else
        # 今回の試行が正解の場合、既存の不正解の試行を更新する
        previous_attempt.correct = (quiz_attempt_params[:user_answer] == correct_answer_string)
        @quiz_attempt = previous_attempt
      end
    else
      @quiz_attempt = QuizAttempt.new(quiz_attempt_params)
      @quiz_attempt.user_id = current_user.id
      @quiz_attempt.correct = (quiz_attempt_params[:user_answer] == correct_answer_string)
    end

    begin
      @quiz_attempt.save!
      if @quiz_attempt.correct
        current_user.points += 10
        current_user.save
      end
      update_level(current_user)
      render json: {
        correct: @quiz_attempt.correct,
        current_points: current_user.points,
        current_level: current_user.level
      }, status: :created
    rescue => e
      render json: { message: e.message }, status: :unprocessable_entity
    end
  end

  private

  def quiz_attempt_params
    params.require(:quiz_attempt).permit(:quiz_id, :user_answer)
  end

  def update_level(user)
    level_thresholds = [100,200,300,400,500,600,700,800,900,1000]
    level_thresholds.each_with_index do |threshold, index|
      if user.points >= threshold && user.level == (index + 1)
        user.update!(level: index + 2)
        break
      end
    end
  end
end