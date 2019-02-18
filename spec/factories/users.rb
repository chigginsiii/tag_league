FactoryBot.define do
  factory :user do
    name { "Test McTest" }
    nickname { "Testy" }
    sequence(:email) { |n| "test_#{n}@example.com" }
    password { "password" }
  end
end
