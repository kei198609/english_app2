require 'rails_helper'

RSpec.describe "Api::V1::Quizzes", type: :request do
  let(:user) { create(:user) }
  let(:category) { create(:category) }
  let!(:quizzes) { create_list(:quiz, 5, category: category) }
  let(:quiz) { quizzes.first }
  let(:quiz_id) { quiz.id }
  let(:headers) { authenticated_header(user) }

  describe "GET /index" do
    before { get api_v1_quizzes_path, headers: headers }

    it "成功のレスポンスが返される" do
      expect(response).to have_http_status(:success)
    end

    it "ページごとの正しいクイズを返す" do
      expect(json['quizzes'].size).to eq(3)
    end

    it "正しいページネーション情報を返す" do
      expect(json['total_pages']).to eq(2)
      expect(json['current_page']).to eq(1)
    end

    it "カテゴリーとともにクイズを返す" do
      json['quizzes'].each do |returned_quiz|
        expect(returned_quiz).to include("category")
      end
    end
  end

  describe "GET /show" do
    before { get api_v1_quiz_path(quiz_id), headers: headers }

    it "成功のレスポンスが返される" do
      expect(response).to have_http_status(:success)
    end

    it "正しいクイズを返す" do
      expect(json['id']).to eq(quiz_id)
    end

    it "カテゴリーとともにクイズを返す" do
      expect(json).to include("category")
    end
  end
end
