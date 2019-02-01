class SeriesEvent < ApplicationRecord
  belongs_to :league_series
  has_many :player_events, inverse_of: :series_event
  has_many :players, through: :player_events
  accepts_nested_attributes_for :player_events

  validates_associated :league_series
  validates :title, presence: true
  validates :event_start_time, :event_end_time, presence: true
  validate :validate_event_time_range

  private

  def validate_event_time_range
    return if event_start_time < event_end_time
    errors.add(:base, 'invalid time range')
  end
end
