class Api::V1::QuizAttemptsController < ApplicationController
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
      render json: { correct: @quiz_attempt.correct }, status: :created
    else
      render json: @quiz_attempt.errors, status: :unprocessable_entity
    end
  end

  private

  def quiz_attempt_params
    params.require(:quiz_attempt).permit(:quiz_id, :user_answer)
  end
end