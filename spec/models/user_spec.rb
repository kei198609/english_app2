require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with a name, email, and password" do
    # 名前、メール、職種、パスワードがあれば有効な状態であること
    user = User.new(
      name:       "Aaron",
      email:      "tester@example.com",
      occupation: "hoge",
      password:   "password",
    )
    expect(user).to be_valid
  end
  it "is invalid without an email address" do
    # メールアドレスがなければ無効な状態であること
    user = User.new(
      name:       "Aaron",
      email: nil,
      occupation: "hoge",
      password:   "password"
    )
    expect(user).to_not be_valid
  end

end

