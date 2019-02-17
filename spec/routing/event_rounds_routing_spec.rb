require "rails_helper"

RSpec.describe Api::V1::EventRoundsController, type: :routing do
  describe "routing" do
    it "routes to #show" do
      expect(get: "/api/v1/event_rounds/1").to route_to("api/v1/event_rounds#show", id: "1")
    end
  end
end
