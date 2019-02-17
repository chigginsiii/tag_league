require "rails_helper"

RSpec.describe "EventRounds", tyoe: :request do
  describe "GET /api/v1/event_rounds/:id" do
    it "gets an event round" do
      s_event = create(:series_event)
      course = create(:course)
      e_round = s_event.event_rounds.create!(
        course: course, round_num: 1
      )

      get api_v1_event_round_path(e_round.id)

      ap response
      ap JSON.parse(response.body)

      expect(response).to have_http_status(200)
    end
  end
end
