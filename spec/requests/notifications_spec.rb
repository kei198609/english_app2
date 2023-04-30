require 'rails_helper'

RSpec.describe "Notifications", type: :request do
  describe "GET notifications#index" do
    # ユーザーがサインインしているとき
    context "when signed in" do
      before do
        @user = create(:user)
        sign_in @user
      end

      # 通知が表示されていること
      it "shows notifications if they exist" do
        notification = build(:notification)
        notification.visited = @user
        notification.save
        get notifications_path
        expect(response).to have_http_status(200)
        expect(response.body).to include(notification.action)
      end
    end

    context "when not signed in" do
      # サインインしていない場合リダイレクトされること
      it "redirects to the login page" do
        get notifications_path
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end