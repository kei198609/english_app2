FactoryBot.define do
  factory :article_reading do
    user { nil }
    article { nil }
    read { false }
  end
end
