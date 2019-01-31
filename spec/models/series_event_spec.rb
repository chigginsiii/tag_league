require 'rails_helper'

RSpec.describe SeriesEvent, type: :model do
  before do
    @league_series = create(:league_series)
  end

  it 'is an event in a league series' do
    series_event = SeriesEvent.new(
      league_series: @league_series,
      title: 'Test Event',
      event_start_time: Time.current,
      event_end_time: Time.current + 1.second
    )
    expect(series_event).to be_valid
  end

  it 'validates start and end dates' do
    series_event = build(:series_event, event_start_time: Time.now, event_end_time: Time.now - 1.second)
    expect(series_event).not_to be_valid
    expect(series_event.errors[:base]).to include('invalid time range')
  end
end
