require 'rails_helper'

RSpec.describe 'SeriesEvents', type: :request do
  describe 'GET /series_events' do
    it 'works! (now write some real specs)' do
      get series_events_path
      expect(response).to have_http_status(200)
    end
  end
end
