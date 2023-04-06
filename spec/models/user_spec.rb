require 'rails_helper'

RSpec.describe User, type: :model do
  # 名前、メール、職種、パスワードがあれば有効な状態であること
  it "is valid with a name, email, and password" do
    expect(FactoryBot.build(:user)).to be_valid
  end
  # メールアドレスがなければ無効な状態であること
  it "is invalid without an email address" do
    user = FactoryBot.build(:user, email: nil)
    expect(user).to_not be_valid
  end

  # 重複したメールアドレスなら無効な状態であること
  it "is invalid with a duplicate email address" do
    FactoryBot.create(:user, email: "aaron@example.com")
    user = FactoryBot.build(:user, email: "aaron@example.com")
    user.valid?
    expect(user.errors[:email]).to include("は既に登録済みです。")
  end

  # 名前がなければ無効な状態であること
  it "is invalid without an name" do
    user = FactoryBot.build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include("が入力されていません。")
  end
  # 職種がなければ無効な状態であること
  it "is invalid without an name" do
    user = FactoryBot.build(:user, occupation: nil)
    user.valid?
    expect(user.errors[:occupation]).to include("が入力されていません。")
  end
  # メールアドレスがなければ無効な状態であること
  it "is invalid without an email" do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("が入力されていません。")
  end
  #名前が10文字以上なら無効な状態であること
  it "is name should not be too long" do
    user = FactoryBot.build(:user, name: "a" * 11)
    user.valid?
    expect(user.errors[:name]).to include("は10文字以内で入力してください。")
  end
  #パスワードが6文字未満なら無効な状態であること
  it "is password should not be too short" do
    user = FactoryBot.build(:user, password: "a" * 5)
    user.valid?
    expect(user.errors[:password]).to include("は6文字以上で入力してください。")
  end

end