require "rails_helper"

RSpec.describe Api::V1::EventRoundsController, type: :controller do
  let(:s_event) { create(:series_event) }
  let(:course) { create(:course) }

  # describe "GET #index" do
  #   it "returns http success" do
  #     get :index, params: { league_id: league.id }
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  describe "GET #show" do
    it "returns http success" do
      e_round = create(:event_round, series_event: s_event, course: course)

      get :show, params: { id: e_round.id }
      expect(response).to have_http_status(:success)
    end
  end
end
