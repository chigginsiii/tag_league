# frozen_string_literal: true

class LeagueSeries < ApplicationRecord
  belongs_to :league
  has_many :series_players
  has_many :players, through: :series_players
  has_many :series_events
  alias_attribute :events, :series_events
end
