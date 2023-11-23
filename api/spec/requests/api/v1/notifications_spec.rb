require 'rails_helper'

RSpec.describe "Api::V1::Notifications", type: :request do
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }
  let(:post) { create(:post, user: user) }
  let(:headers) { authenticated_header(user) }
  let!(:notifications) { create_list(:notification, 12, visited: user, visitor: other_user, post: post) }

  describe "GET /index" do
    context "ユーザーが認証されていない場合" do
      it "認証エラーを返す" do
        get api_v1_notifications_path
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context "ユーザーが認証されている場合" do
      before do
        get api_v1_notifications_path, headers: headers
      end

      it "ページネーションとともに通知を返す" do
        expect(response).to have_http_status(:success)
        expect(json.size).to eq(10) # Because per_page is set to 10
      end

      it "正しい形式の通知を返す" do
        notification = json.first
        expect(notification).to include("visitor", "visited", "post")
        expect(notification["post"]).to include("user")
      end
    end
  end
end