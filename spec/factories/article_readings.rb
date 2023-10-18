FactoryBot.define do
  factory :article_reading do
    association :user
    association :article
    read { false }
  end
end