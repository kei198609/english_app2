require 'rails_helper'

RSpec.describe "Comments", type: :request do
  # describe "POST comments#create" do

  #   # ユーザーがログインしているとき
  #   context "when user is logged in" do
  #     before do
  #       @user = FactoryBot.create(:user)
  #       sign_in(@user)
  #       @post = FactoryBot.create(:post, user: @user)
  #       @comment = FactoryBot.create(:comment, user: @user, post: @post)
  #     end
  #     # コメントを作成できること
  #     it "creates a new comment" do
  #       expect {
  #         post post_comments_path(post_id: @post.id), params: { comment: { comment: "test comment" } }
  #       }.to change(Comment, :count).by(1)
  #       expect(response).to redirect_to(post_path(@post.id))
  #     end
  #     # コメントを削除できること
  #     it "deletes a comment" do
  #       expect {
  #         delete post_comment_path(post_id: @post.id, id: @comment.id)
  #       }.to change(Comment, :count).by(-1)
  #       expect(response).to redirect_to(post_path(@post.id))
  #     end
  #     # コメント作成時、コメント内容が空欄だった場合にコメントの数が変わらないこと
  #     it "does not create a comment" do
  #       expect do
  #         post post_comments_path(post_id: @post.id), params: { comment: { comment: "" } }
  #       end.not_to change(Comment, :count)
  #     end
  #   end
  # end
end
