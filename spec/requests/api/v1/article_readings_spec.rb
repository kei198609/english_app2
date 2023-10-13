require 'rails_helper'

RSpec.describe "Api::V1::ArticleReadings", type: :request do
  let(:user) { create(:user) }
  let(:article) { create(:article) }
  let(:valid_params) { { article_reading: { article_id: article.id, read: true } } }
  let(:user_with_high_points) { create(:user, points: 90) } # 90ポイントを持っているユーザーを作成
  let(:user_with_low_points) { create(:user, points: 50) } # 50ポイントを持っているユーザーを作成


  describe 'POST /create' do
    context 'ログイン時' do
      it '新しい記事の読了を作成' do
        headers = authenticated_header(user)
        expect {
          post api_v1_article_readings_path, params: valid_params, headers: headers
        }.to change(ArticleReading, :count).by(1)
      end

      it 'ユーザーポイントを増加' do
        headers = authenticated_header(user)
        expect {
          post api_v1_article_readings_path, params: valid_params, headers: headers
        }.to change { user.reload.points }.by(10)
      end

      it 'ユーザーのポイントがレベルアップの閾値を超える場合レベルが上がること' do
        headers = authenticated_header(user_with_high_points)
        expect {
          post api_v1_article_readings_path, params: valid_params, headers: headers
        }.to change { user_with_high_points.reload.level }.to eq(2)
      end

      it 'ユーザーのポイントがレベルアップの閾値を超えない場合レベルは上がらないこと' do
        headers = authenticated_header(user_with_low_points)
        expect {
          post api_v1_article_readings_path, params: valid_params, headers: headers
        }.not_to change(user_with_low_points.reload, :level)
      end
    end

    context 'ログインしていない場合' do
      it '未認証を返す' do
        post api_v1_article_readings_path, params: valid_params
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context '無効なパラメータの場合' do
      let(:invalid_params) { { article_reading: { read: true } } } # article_idをわざと外している

      it '記事の読了を作成しない' do
        headers = authenticated_header(user)
        expect {
          post api_v1_article_readings_path, params: invalid_params, headers: headers
        }.not_to change(ArticleReading, :count)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end