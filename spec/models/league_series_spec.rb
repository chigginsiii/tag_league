require 'rails_helper'

RSpec.describe LeagueSeries do
  before do
    @league = create(:league)
  end

  it 'has a title, start, and end' do
    series = create_series(@league)
    expect(series.title).to eq 'Test Series'
    expect(series.date_start).to eq Date.today
    expect(series.date_end).to eq Date.today + 1.week
  end

  it 'has players' do
    player = create(:player, league: @league)
    series = create_series(@league)

    series.series_players.create!(player: player)
    expect(series.players.first).to eq player
  end

  def create_series(_league)
    LeagueSeries.create!(
      league: @league,
      title: 'Test Series',
      date_start: Date.today,
      date_end: Date.today + 1.week
    )
  end
end
