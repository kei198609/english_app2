require 'rails_helper'

RSpec.describe "Api::V1::Auth::Registrations", type: :request do
  describe "POST /auth" do
    let(:valid_user_params) do
      {
        name: 'Test User',
        email: 'user@example.com',
        password: 'password123',
        occupation: 'Developer',
        password_confirmation: 'password123'
      }
    end
    context "有効なパラメータの場合" do
      it "新規ユーザーを作成する" do
        expect {
          post '/api/v1/auth', params: { user: valid_user_params }
        }.to change(User, :count).by(1)
        expect(response).to have_http_status(:ok)
      end
    end
    context "無効なパラメータの場合" do
      it "名前が欠けている場合ユーザーは作成されない" do
        invalid_params = valid_user_params.merge(name: nil)
        expect {
          post '/api/v1/auth', params: { user: invalid_params }
        }.not_to change(User, :count)
        expect(response).to have_http_status(:unprocessable_entity)
      end
      it "パスワードとパスワード確認が一致しない場合ユーザーは作成されない" do
        invalid_params = valid_user_params.merge(password_confirmation: 'wrong')
        expect {
          post '/api/v1/auth', params: { user: invalid_params }
        }.not_to change(User, :count)
        expect(response).to have_http_status(:unprocessable_entity)
      end
      it "既に取得されているメールアドレスを使用した場合ユーザーは作成されない" do
        create(:user, email: valid_user_params[:email])
        expect {
          post '/api/v1/auth', params: { user: valid_user_params }
        }.not_to change(User, :count)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end