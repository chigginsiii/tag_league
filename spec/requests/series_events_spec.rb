require "rails_helper"

RSpec.describe "SeriesEvents", type: :request do
  describe "GET /api/v1/league/:league_id/series_events" do
    it "gets series events for a league_series" do
      s_event = create(:series_event)
      get api_v1_league_series_events_path(league_id: s_event.league_series.league.id)
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /api/v1/series_events/:id" do
    it "gets a series event" do
      s_event = create(:series_event)
      get api_v1_series_event_path(s_event.id)
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /api/v1/series_events/:id/signin" do
    it "authorizes a league player in a series to access an event" do
      s_event = create(:series_event)
      player = create(:player, league: s_event.league_series.league)
      s_event.league_series.series_players.create!(player: player)
      s_event.league_series.save!

      # takes player number and PIN
      post api_v1_series_event_signin_path(
        s_event.id,
        player_number: player.player_number, pin: player.pin
      )

      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)).to eq("token" => player.token)
    end
  end
end
