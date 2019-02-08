FactoryBot.define do
  factory :hole do
    position { 1 }
    label { 'Hole 1' }
    course { nil }

    trait :with_pin do
      after :create do |hole|
        create(:pin, hole: hole)
      end
    end
  end
end
