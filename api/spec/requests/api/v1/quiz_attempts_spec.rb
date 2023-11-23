require 'rails_helper'

RSpec.describe "Api::V1::QuizAttempts", type: :request do
  let(:user) { create(:user) }
  let(:category) { create(:category) }
  let(:quiz) { create(:quiz, category: category, sentence_english: ["This", "is", "a", "test"].to_json) }
  let(:valid_params) { { quiz_attempt: { quiz_id: quiz.id, user_answer: "This is a test" } } }
  let(:user_with_high_points) { create(:user, points: 90) } # 90ポイントを持っているユーザーを作成
  let(:user_with_low_points) { create(:user, points: 50) } # 50ポイントを持っているユーザーを作成

  describe 'POST /create' do
    context 'ログイン時' do
      it '新しいクイズの試行を作成' do
        headers = authenticated_header(user)
        expect {
          post api_v1_quiz_attempts_path, params: valid_params, headers: headers
        }.to change(QuizAttempt, :count).by(1)
      end

      it 'ユーザーポイントを増加' do
        headers = authenticated_header(user)
        expect {
          post api_v1_quiz_attempts_path, params: valid_params, headers: headers
        }.to change { user.reload.points }.by(10)
      end

      it 'ユーザーのポイントがレベルアップの閾値を超える場合レベルが上がること' do
        headers = authenticated_header(user_with_high_points)
        expect {
          post api_v1_quiz_attempts_path, params: valid_params, headers: headers
        }.to change { user_with_high_points.reload.level }.to eq(2)
      end

      it 'ユーザーのポイントがレベルアップの閾値を超えない場合レベルは上がらないこと' do
        headers = authenticated_header(user_with_low_points)
        expect {
          post api_v1_quiz_attempts_path, params: valid_params, headers: headers
        }.not_to change(user_with_low_points.reload, :level)
      end
    end

    context 'ログインしていない場合' do
      it '未認証を返す' do
        post api_v1_quiz_attempts_path, params: valid_params
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
