require 'rails_helper'

RSpec.describe User, type: :model do
  # 名前、メール、職種、パスワードがあれば有効な状態であること
  it "is valid with a name, email, and password" do
    user = User.new(
      name:       "Aaron",
      email:      "tester@example.com",
      occupation: "hoge",
      password:   "password",
    )
    expect(user).to be_valid
  end
  # メールアドレスがなければ無効な状態であること
  it "is invalid without an email address" do
    user = User.new(
      name:       "Aaron",
      email: nil,
      occupation: "hoge",
      password:   "password"
    )
    expect(user).to_not be_valid
  end

  # 重複したメールアドレスなら無効な状態であること
  it "is invalid with a duplicate email address" do
    User.create(
      name:       "Joe",
      email:      "tester@example.com",
      occupation: "hoge",
      password:   "dottle-nouveau-pavilion-tights-furze",
    )

    user = User.new(
      name:       "Jane",
      email:      "tester@example.com",
      occupation: "hoge",
      password:   "dottle-nouveau-pavilion-tights-furze",
    )
    user.valid?
    expect(user.errors[:email]).to include("は既に登録済みです。")
  end

  # 名前がなければ無効な状態であること
  it "is invalid without an name" do
    user = User.new(name: nil)
    user.valid?
    expect(user.errors[:name]).to include("が入力されていません。")
  end
  # 職種がなければ無効な状態であること
  it "is invalid without an name" do
    user = User.new(occupation: nil)
    user.valid?
    expect(user.errors[:occupation]).to include("が入力されていません。")
  end
end

