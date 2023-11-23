FactoryBot.define do
  factory :post do
    association :user
    genre { "foobar" }
    title { "hello" }
    content { "hoge" }
  end
end
