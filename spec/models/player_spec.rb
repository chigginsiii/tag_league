# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Player' do
  before do
    @league = create(:league)
  end

  it 'has a player number' do
    p = build(:player, league: @league, display_name: 'Bob')
    expect(p.player_number).to be_nil

    p.save!
    expect(p.player_number).to eq(1)
  end

  it 'has a pin' do
    p = build(:player, league: @league, display_name: 'Bob')
    expect(p.pin).to be_nil

    p.save!
    expect(p.pin).to match(/\A\d{6}\Z/)
  end
end
