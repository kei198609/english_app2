require 'rails_helper'

RSpec.describe "Api::V1::Categories", type: :request do
  let(:user) { create(:user) }
  let!(:categories) { create_list(:category, 3) }  # 3つのカテゴリを作成
  let!(:quizzes) { create_list(:quiz, 2, category: categories.first) } # 1つのカテゴリに関連する2つのクイズを作成
  let(:headers) { authenticated_header(user) }

  describe "GET /index" do
    before { get api_v1_categories_path, headers: headers}

    it "成功のレスポンスが返される" do
      expect(response).to have_http_status(:success)
    end

    it "正しいカテゴリ数を返す" do
      expect(json.size).to eq(3)
    end

    it "カテゴリと関連するクイズも返す" do
      category_with_quizzes = json.first
      expect(category_with_quizzes['quizzes'].size).to eq(2)
    end
  end

  context "認証されていない場合" do
    before { get api_v1_categories_path }  # 認証情報を含めずにリクエスト

    it "不正なステータスを返す" do
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
