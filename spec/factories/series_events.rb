FactoryBot.define do
  factory :series_event do
    league_series
    title { 'Test Event' }
    event_start_time { Time.current }
    event_end_time { Time.current + 1.day }
  end
end
