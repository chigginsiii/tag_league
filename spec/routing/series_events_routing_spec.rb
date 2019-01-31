require 'rails_helper'

RSpec.describe SeriesEventsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: 'api/series_events').to route_to('series_events#index')
    end

    it 'routes to #show' do
      expect(get: 'api/series_events/1').to route_to('series_events#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: 'api/series_events').to route_to('series_events#create')
    end

    it 'routes to #update via PUT' do
      expect(put: 'api/series_events/1').to route_to('series_events#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: 'api/series_events/1').to route_to('series_events#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: 'api/series_events/1').to route_to('series_events#destroy', id: '1')
    end
  end
end
