require 'rails_helper'

RSpec.describe "Bookmarks", type: :request do
  # describe "POST #create" do
  #   # ユーザーがログインしていないとき
  #   context "when user is not logged in" do
  #     # ログインページにリダイレクトされていること
  #     it "redirects to the login page" do
  #       post post_bookmarks_path(post_id: 1)
  #       expect(response).to redirect_to(new_user_session_path)
  #     end
  #   end
  #   # ユーザーがログインしているとき
  #   context "when user is logged in" do
  #     before do
  #       @user = FactoryBot.create(:user)
  #       sign_in(@user)
  #       @post = FactoryBot.create(:post, user: @user)
  #     end
  #     # 新しいブックマークを作成できること
  #     it "creates a new bookmark" do
  #       expect {
  #         post post_bookmarks_path(post_id: @post.id)
  #       }.to change(Bookmark, :count).by(1)
  #       expect(response).to redirect_to(post_path(@post.id))
  #     end
  #   end
  # end

  # describe "DELETE #destroy" do
  #   # ユーザーがログインしていないとき
  #   context "when user is not logged in" do
  #     # ログインページにリダイレクトされていること
  #     it "redirects to the login page" do
  #       delete post_bookmark_path(post_id: 1, id: 1)
  #       expect(response).to redirect_to(new_user_session_path)
  #     end
  #   end
  #   # ユーザーがログインしているとき
  #   context "when user is logged in" do
  #     before do
  #       @user = FactoryBot.create(:user)
  #       sign_in(@user)
  #       @post = FactoryBot.create(:post, user: @user)
  #       @bookmark = @post.bookmarks.create(user: @user)
  #     end
  #     # ブックマークを削除できること
  #     it "deletes the bookmark" do
  #       expect {
  #         delete post_bookmark_path(post_id: @post.id, id: @bookmark.id)
  #       }.to change(Bookmark, :count).by(-1)
  #       expect(response).to redirect_to(post_path(@post.id))
  #     end
  #   end
  # end
end