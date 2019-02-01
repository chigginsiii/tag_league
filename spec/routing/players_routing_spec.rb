require 'rails_helper'

RSpec.describe PlayersController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/api/leagues/1/players').to route_to('players#index', league_id: '1')
    end

    it 'routes to #show' do
      expect(get: '/api/players/1').to route_to('players#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/api/leagues/1/players').to route_to('players#create', league_id: '1')
    end

    it 'routes to #update via PUT' do
      expect(put: '/api/players/1').to route_to('players#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/api/players/1').to route_to('players#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/api/players/1').to route_to('players#destroy', id: '1')
    end
  end
end
