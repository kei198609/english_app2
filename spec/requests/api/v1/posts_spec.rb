require 'rails_helper'

RSpec.describe "Api::V1::Posts", type: :request do
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }
  let(:sample_post) { create(:post, user: user) }
  let(:headers) { authenticated_header(user) }

  describe "GET /index" do
    before do
      create_list(:post, 5, user: user, genre: "foobar")
      create_list(:post, 5, user: other_user, genre: "bazqux")
    end

    it "ユーザーIDが指定された場合、そのユーザーの投稿を返す" do
      get api_v1_posts_path, params: { user_id: user.id }, headers: headers
      expect(response).to have_http_status(:ok)
      json = JSON.parse(response.body)
      expect(json["posts"].length).to eq(3) # per(3) のため
    end

    it "ジャンルが指定された場合、そのジャンルの投稿を返す" do
      get api_v1_posts_path, params: { genre: "foobar" }, headers: headers
      expect(response).to have_http_status(:ok)
      json = JSON.parse(response.body)
      expect(json["posts"].length).to eq(3) # per(3) のため
    end
  end


  describe "POST /create" do
    it "有効な属性で投稿を作成する" do
      post_params = {
        post: {
          title: "Test Title",
          content: "Test Content",
          genre: "Test Genre"
        }
      }
      post api_v1_posts_path, params: post_params, headers: headers
      expect(response).to have_http_status(:created)
      json = JSON.parse(response.body)
      expect(json["title"]).to eq("Test Title")
    end

    it "無効な属性で投稿を作成するとエラーメッセージを返す" do
      post_params = {
        post: {
          title: "",
          content: "",
          genre: "Test Genre"
        }
      }
      post api_v1_posts_path, params: post_params, headers: headers
      expect(response).to have_http_status(:unprocessable_entity)
      json = JSON.parse(response.body)
      expect(json["errors"]).to include("Titleを入力してください")
    end
  end
end