class Api::V1::QuizAttemptsController < ApplicationController
  def index
    @quiz_attempts = QuizAttempt.where(user_id: current_user.id)
    render json: @quiz_attempts
  end

  def create
    @quiz_attempt = QuizAttempt.new(quiz_attempt_params)
    @quiz_attempt.user_id = current_user.id # 現在のログインユーザーのIDをセット

    # データベースからの正解
    # correct_answer = Quiz.find(params[:quiz_id]).sentence_english
    correct_answer_array = JSON.parse(Quiz.find(params[:quiz_id]).sentence_english)
    correct_answer_string = correct_answer_array.join(' ')

    # ユーザーの答えが正しいかどうかを確認する
    # @quiz_attempt.correct = (quiz_attempt_params[:user_answer] == correct_answer)
    @quiz_attempt.correct = (quiz_attempt_params[:user_answer] == correct_answer_string)


    if @quiz_attempt.save
      # ユーザーが正解した場合、ポイントを追加
      if @quiz_attempt.correct
        current_user.points += 10
        current_user.save
      end

      # ポイントに応じてユーザーのレベルを更新
      update_level(current_user)

      render json: { correct: @quiz_attempt.correct }, status: :created
    else
      render json: @quiz_attempt.errors, status: :unprocessable_entity
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