# frozen_string_literal: true

class LeagueSeries < ApplicationRecord
  belongs_to :league
  has_many :series_players, dependent: :destroy
  has_many :players, through: :series_players
  has_many :series_events, dependent: :destroy
  alias_attribute :events, :series_events

  def next_event
    series_events.where('event_start_time > ?', Time.now).order(:event_start_time).first
  end

  def current_event
    series_events
      .where('event_start_time < ?', Time.now)
      .where('event_end_time > ?', Time.now)
      .first
  end
end
