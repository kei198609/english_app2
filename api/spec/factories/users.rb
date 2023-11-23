FactoryBot.define do
  factory :user do
    name { "Aaron" }
    sequence(:email) { |n| "tester#{n}@example.com" }
    occupation { "hoge" }
    password { "dottle-nouveau-pavilion-tights-furze" }
  end
end