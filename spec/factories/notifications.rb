FactoryBot.define do
  factory :notification do
    association :visitor, factory: :user
    association :visited, factory: :user
    association :post, factory: :post
    # association :comment, factory: :comment
  end
end
