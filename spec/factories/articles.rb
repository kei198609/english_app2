FactoryBot.define do
  factory :article do
    title { "MyString" }
    content { "MyText" }
    association :category
  end
end
