require 'rails_helper'

RSpec.describe "Api::V1::Auth::Sessions", type: :request do
  describe "POST /auth/sessions/guest_sign_in" do
    it "ゲストユーザーとしてサインインすると成功する" do
      post '/api/v1/auth/sessions/guest_sign_in'

      expect(response).to have_http_status(:ok)
      expect(json['data']).to include('id', 'email', 'name')
    end
  end
  def json
    JSON.parse(response.body)
  end
end