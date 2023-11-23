require 'rails_helper'

RSpec.describe "Api::V1::Articles", type: :request do
  let!(:articles) { create_list(:article, 5) }
  let(:article) { articles.first }
  let(:article_id) { article.id }
  let(:user) { create(:user) }
  let(:headers) { authenticated_header(user) }

  describe "GET /index" do
    before { get api_v1_articles_path, headers: headers }

    it "成功のレスポンスが返される" do
      expect(response).to have_http_status(:success)
    end

    it "ページごとの正しい記事数を返す" do
      expect(json['articles'].size).to eq(3)
    end

    it "正しいページネーション情報を返す" do
      expect(json['total_pages']).to eq(2)
      expect(json['current_page']).to eq(1)
    end

    it "カテゴリーとともに記事を返す" do
      json['articles'].each do |returned_article|
        expect(returned_article).to include("category")
      end
    end
  end

  describe "GET /show" do
    before { get api_v1_article_path(article_id), headers: headers }

    it "成功のレスポンスが返される" do
      expect(response).to have_http_status(:success)
    end

    it "正しい記事を返す" do
      expect(json['id']).to eq(article_id)
    end

    it "カテゴリーとともに記事を返す" do
      expect(json).to include("category")
    end
  end
end
