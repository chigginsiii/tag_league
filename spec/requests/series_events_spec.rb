require 'rails_helper'

RSpec.describe 'SeriesEvents', type: :request do
  describe 'GET /series_events' do
    it 'works! (now write some real specs)' do
      s_event = create(:series_event)
      get league_series_events_path(league_id: s_event.league_series.league.id)
      expect(response).to have_http_status(200)
    end
  end
end
