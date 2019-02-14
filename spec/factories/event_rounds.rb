FactoryBot.define do
  factory :event_round do
    series_event { nil }
    course { nil }

    sequence(:round_num, 1) { |n| n }
  end
end
