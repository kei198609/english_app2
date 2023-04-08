FactoryBot.define do
  factory :post do
    scene { "foobar" }
    subject_english { "hello" }
    content_english { "hoge" }
  end
end
