FactoryBot.define do
  factory :quiz_attempt do
    user { nil }
    quiz { nil }
    user_answer { "MyString" }
    correct { false }
  end
end
