require 'rails_helper'

RSpec.describe "Api::V1::Likes", type: :request do
  let(:user) { create(:user) }
  let!(:sample_post) { create(:post, user: user) }
  let(:headers) { authenticated_header(user) }

  describe "POST /create" do
    context "ログインユーザーの場合" do
      it "いいねをする" do
        expect {
          post api_v1_post_likes_path(post_id: sample_post.id), headers: headers
        }.to change(Like, :count).by(1)

        expect(response).to have_http_status(201)
        json_response = JSON.parse(response.body)
        expect(json_response['message']).to eq('Liked successfully')
        expect(json_response['liked']).to be_truthy
      end
    end
  end

  describe "DELETE /destroy" do
    let!(:like) { create(:like, user: user, post: sample_post) }

    context "ログインユーザーの場合" do
      it "いいねを取り消す" do
        expect {
          delete api_v1_post_likes_path(post_id: sample_post.id), headers: headers
        }.to change(Like, :count).by(-1)

        expect(response).to have_http_status(200)
        json_response = JSON.parse(response.body)
        expect(json_response['message']).to eq('Unliked successfully')
        expect(json_response['liked']).to be_falsy
      end
    end
  end
end