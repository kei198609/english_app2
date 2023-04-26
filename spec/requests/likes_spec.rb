require 'rails_helper'

RSpec.describe "Likes", type: :request do
  describe "POST likes#create" do
    # ユーザーがサインインしているとき
    context "when signed in" do
      before do
        @user = create(:user)
        sign_in @user
      end
      # いいねを作成できること
      it "creates a new like for the post" do
        post = create(:post, user: @user)
        expect {
          post post_likes_path(post), xhr: true
        }.to change(Like, :count).by(1)
      end
    end
    # ユーザーがサインインしていないとき
    context "when not signed in" do
      before do
        @user = create(:user)
      end
      # いいねを作成できないこと
      it "redirects to the login page" do
        post = create(:post, user: @user)
        post post_likes_path(post), xhr: true
        expect(response).to have_http_status(401)
      end
    end
  end

  describe "DELETE likes#destroy" do
    context "when logged in" do
      before do
        @user = create(:user)
        sign_in @user
      end
      it "deletes the like for the post" do
        post = create(:post, user: @user)
        like = create(:like, user: @user, post: post)
        expect {
          delete post_likes_path(post, like), xhr: true
        }.to change(Like, :count).by(-1)
      end
    end
  end
end