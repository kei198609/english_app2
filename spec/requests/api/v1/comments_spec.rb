require 'rails_helper'

RSpec.describe "Api::V1::Comments", type: :request do
  let(:user) { create(:user) }
  let!(:sample_post) { create(:post, user: user) }
  let(:headers) { authenticated_header(user) }

  describe "POST /create" do
    context "ログインユーザーの場合" do
      it "コメントを作成する" do
        comment_attributes = attributes_for(:comment)
        expect {
          post api_v1_post_comments_path(post_id: sample_post.id), params: { comment: comment_attributes }, headers: headers
        }.to change(Comment, :count).by(1)

        expect(response).to have_http_status(:success)
        json_response = JSON.parse(response.body)
        expect(json_response['status']).to eq('success')
        expect(json_response['comment']['comment']).to eq(comment_attributes[:comment])
      end
    end
  end

  describe "DELETE /destroy" do
    let!(:comment) { create(:comment, user: user, post: sample_post) }

    context "ログインユーザーの場合" do
      it "コメントを削除する" do
        expect {
          delete api_v1_post_comment_path(post_id: sample_post.id, id: comment.id), headers: headers
        }.to change(Comment, :count).by(-1)

        expect(response).to have_http_status(:success)
        json_response = JSON.parse(response.body)
        expect(json_response['status']).to eq('success')
      end
    end
  end
end
