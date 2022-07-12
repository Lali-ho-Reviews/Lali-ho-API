FactoryBot.define do
  factory :review do
    user { nil }
    company { nil }
    text { "MyString" }
    rating { 1 }
    author { "MyString" }
  end
end
