FactoryBot.define do
  factory :league_series do
    league
    title { 'Test Series' }
    date_start { Date.today }
    date_end { Date.today + 1.month }
  end
end
