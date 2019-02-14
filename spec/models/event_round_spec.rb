require "rails_helper"

RSpec.describe EventRound, type: :model do
  let(:series_event) { create(:series_event) }
  let(:course) { create(:course) }

  it "is an event round on a course" do
    round = make_round
    expect(round.course.id).to eq course.id
    expect(round.series_event.id).to eq series_event.id
    expect(round.round_num).to eq 1
  end

  it "has a bunch of players" do
    alice = create(:player, display_name: "Alice")
    bob = create(:player, display_name: "Bob")
    round = make_round

    round.player_rounds.create(player: alice)
    round.player_rounds.create(player: bob)

    expect(round.players.size).to eq 2
  end

  def make_round
    create(:event_round, series_event: series_event, course: course, round_num: 1)
  end
end
