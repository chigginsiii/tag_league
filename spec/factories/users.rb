FactoryBot.define do
  factory :user do
    name { "Test McTest" }
    nickname { "Testy" }
    email { "test@example.com" }
    password { "password" }
  end
end
