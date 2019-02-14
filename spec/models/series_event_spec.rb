require "rails_helper"

RSpec.describe SeriesEvent, type: :model do
  describe "series event" do
    it { is_expected.to belong_to(:league_series) }
    it { is_expected.to have_many(:player_events) }
    it { is_expected.to have_many(:players) }
    it { is_expected.to accept_nested_attributes_for(:player_events) }
    it { validate_presence_of :title }
    it { validate_presence_of :event_start_time }
    it { validate_presence_of :event_end_time }

    it "is an event in a league series" do
      league_series = create(:league_series)
      series_event = SeriesEvent.new(
        league_series: league_series,
        title: "Test Event",
        event_start_time: Time.current,
        event_end_time: Time.current + 1.second
      )
      expect(series_event).to be_valid
    end

    it "validates start and end dates" do
      league_series = create(:league_series)
      series_event = build(
        :series_event,
        league_series: league_series,
        event_start_time: Time.now,
        event_end_time: Time.now - 1.second
      )
      expect(series_event).not_to be_valid
      expect(series_event.errors[:base]).to include("invalid time range")
    end

    it "has a round" do
    end
  end
end
