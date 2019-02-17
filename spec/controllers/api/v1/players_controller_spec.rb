require "rails_helper"

RSpec.describe Api::V1::PlayersController, type: :controller do
  let(:league) { create(:league) }
  let(:name) { "Disc McGolf" }

  describe "GET #index" do
    it "returns http success" do
      get :index, params: { league_id: league.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      player = create(:player)
      get :show, params: { id: player.id }
      expect(response).to have_http_status(:success)
    end
  end

  # describe 'POST #create' do
  #   it 'returns http success' do
  #     post :create, params: { league_id: league.id, player: { display_name: 'roger' } }
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe 'PATCH #update' do
  #   it 'returns http success' do
  #     player = create(:player)
  #     patch :update, params: { id: player.id, player: { display_name: 'Updated' } }
  #     expect(response).to have_http_status(:success)
  #     player.reload
  #     expect(player.display_name).to eq 'Updated'
  #   end
  # end

  # describe 'DELETE #destroy' do
  #   it 'returns http success' do
  #     player = create(:player)
  #     delete :destroy, params: { id: player.id }
  #     expect(response).to have_http_status(:success)
  #   end
  # end
end
