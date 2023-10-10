require 'rails_helper'

RSpec.describe "Following", type: :request do
  # before do
  #   @user = FactoryBot.create(:user)
  #   @other = FactoryBot.create(:user)
  #   sign_in(@user)
  # end

  # describe "GET #following" do
  #   before { get following_user_path(@user) }
  #   it "returns http success" do
  #     expect(response).to have_http_status(:success)
  #   end
  #   # フォローしているユーザーの正しい数が表示されていること
  #   it "displays the correct number of followed users" do
  #     expect(response.body).to include(@user.following.count.to_s)
  #   end
  #   # フォローしているユーザーのプロフィールへのリンクが表示されていること
  #   it "displays links to the followed users' profiles" do
  #     @user.following.each do |u|
  #       expect(response.body).to include(user_path(u))
  #     end
  #   end
  # end
  # describe "GET #followers" do
  #   before do
  #     get followers_user_path(@user)
  #   end
  #   it "returns http success" do
  #     expect(response).to have_http_status(:success)
  #   end
  #   # フォロワーの正しい数が表示されていること
  #   it "displays the correct number of follower users" do
  #     expect(response.body).to include(@user.followers.count.to_s)
  #   end
  #   # フォロワーのプロフィールへのリンクが表示されていること
  #   it "displays links to the follower users' profiles" do
  #     @user.followers.each do |u|
  #       expect(response.body).to include(user_path(u))
  #     end
  #   end
  # end
  # describe "POST #create" do
  #   # フォローボタンを押すとフォローの数が1増えること
  #   it "should follow a user the standard way" do
  #     expect do
  #       post relationships_path, params: { followed_id: @other.id }
  #     end.to change(@user.following, :count).by(1)
  #   end
  # end
  # describe "DELETE #destroy" do
  #   before do
  #     @user.follow(@other)
  #     @relationship = @user.active_relationships.find_by(followed_id: @other.id)
  #     delete relationship_path(@relationship)
  #   end
  #   # フォローが解除されていること
  #   it "unfollows a user" do
  #     expect(@user.following.include?(@other)).to eq(false)
  #   end
  #   # フォローしているユーザーの数が1減っていること
  #   it "decreases the number of following users by 1" do
  #     expect(@user.following.count).to eq(0)
  #   end
  # end
end
