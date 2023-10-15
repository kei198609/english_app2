require 'rails_helper'

RSpec.describe "Api::V1::Bookmarks", type: :request do
  let(:user) { create(:user) }
  let!(:sample_post) { create(:post, user: user) }
  let(:headers) { authenticated_header(user) }

  describe "POST /create" do
    context "ログインユーザーの場合" do
      it "ブックマークを作成する" do
        expect {
          post api_v1_post_bookmarks_path(post_id: sample_post.id), headers: headers
        }.to change(Bookmark, :count).by(1)

        expect(response).to have_http_status(:success)
        expect(json['bookmarked']).to be_truthy
      end
    end
  end

  describe "DELETE /destroy" do
    let!(:bookmark) { create(:bookmark, user: user, post: sample_post) }

    context "ログインユーザーの場合" do
      it "ブックマークを削除する" do
        expect {
          delete api_v1_post_bookmark_path(post_id: sample_post.id, id: bookmark.id), headers: headers
        }.to change(Bookmark, :count).by(-1)

        expect(response).to have_http_status(:success)
        expect(json['bookmarked']).to be_falsy
      end
    end
  end
end