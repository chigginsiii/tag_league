class SeriesEvent < ApplicationRecord
  belongs_to :league_series
  has_many :event_players, inverse_of: :series_event
  has_many :players, through: :event_players
  accepts_nested_attributes_for :event_players

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
