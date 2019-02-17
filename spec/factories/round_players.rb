FactoryBot.define do
  factory :round_player do
    event_round { nil }
    player { nil }
    round_card { nil }
    score { 1 }
  end
end
