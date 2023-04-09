require 'rails_helper'

RSpec.describe "投稿機能", type: :request do
  describe "GET /posts" do

    # ログインしていない場合リクエストがリダイレクト
    context "ログインしていない場合" do
      it "responds successfully" do
        get new_post_path
        expect(response).to have_http_status(302)
      end
    end
  end
end

RSpec.describe "postsInterface", type: :request do
  include Capybara::RSpecMatchers
  let(:user) { FactoryBot.create(:user, name: "Aaron") }

  describe "post interface" do
    before do
      sign_in(user)
      get root_path
    end
    context "with invalid submission" do
      # 投稿作成時、投稿内容が空欄だった場合にエラーメッセージが表示されること
      it "displays error messages" do
        post posts_path, params: { post: { content_english: "" } }
        expect(response.body).to have_selector('div#error_explanation')
      end
      # 投稿作成時、投稿内容が空欄だった場合に投稿の数が変わらないこと
      it "does not create a post" do
        expect do
          post posts_path, params: { post: { content_english: "" } }
        end.not_to change(Post, :count)
      end
    end

    context "with valid post" do
      let(:content) { "This micropost really ties the room together" }
      # 投稿したら投稿数が変わること
      it "creates a post" do
        expect do
          post posts_path, params: { post: { scene: "foobar",
                                              subject_english: "hello",
                                              content_english: "hello" } }
        end.to change(Post, :count).by(1)
      end
      # 投稿後に new_post_path にリダイレクトされること
      it "redirects to root_url after post" do
        post posts_path, params: { post: { scene: "foobar",
                                              subject_english: "hello",
                                              content_english: "hello" } }
        expect(response).to redirect_to(new_post_path)
      end
    end

  end
end
