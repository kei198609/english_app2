require 'rails_helper'

RSpec.describe User, type: :model do
  it "名前、メール、職種、パスワードがある場合は有効" do
    expect(FactoryBot.build(:user)).to be_valid
  end
  it "メールアドレスがない場合は無効" do
    user = FactoryBot.build(:user, email: nil)
    expect(user).to_not be_valid
  end
  it "重複したメールアドレスの場合は無効" do
    FactoryBot.create(:user, email: "aaron@example.com")
    user = FactoryBot.build(:user, email: "aaron@example.com")
    user.valid?
    expect(user.errors[:email]).to include("は既に登録済みです。")
  end

  it "名前がない場合は無効" do
    user = FactoryBot.build(:user, name: nil)
    user.valid?
    expect(user.errors[:name]).to include("が入力されていません。")
  end
  it "職種がない場合は無効" do
    user = FactoryBot.build(:user, occupation: nil)
    user.valid?
    expect(user.errors[:occupation]).to include("が入力されていません。")
  end
  it "メールアドレスがない場合は無効" do
    user = FactoryBot.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("が入力されていません。")
  end
  it "名前が10文字を超える場合は無効" do
    user = FactoryBot.build(:user, name: "a" * 11)
    user.valid?
    expect(user.errors[:name]).to include("は10文字以内で入力してください。")
  end
  it "パスワードが6文字未満の場合は無効" do
    user = FactoryBot.build(:user, password: "a" * 5)
    user.valid?
    expect(user.errors[:password]).to include("は6文字以上で入力してください。")
  end
end