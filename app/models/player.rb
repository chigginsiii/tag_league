class Player < ApplicationRecord
  has_secure_token

  belongs_to :league
  has_many :series_players
  has_many :league_series, through: :series_players

  has_many :player_events, inverse_of: :player
  accepts_nested_attributes_for :player_events
  has_many :series_events, through: :player_events

  has_many :player_rounds
  has_many :event_rounds, through: :player_rounds

  before_validation :ensure_pin
  before_validation :ensure_player_number

  validates_associated :league
  validates :player_number,
    numericality: { only_integer: true, greater_than_or_equal_to: 1 },
    uniqueness: { scope: :league }

  validates :display_name,
    presence: true,
    uniqueness: { scope: :league }

  validates_format_of :pin, with: /\A\d{6}\Z/

  private

  def ensure_player_number
    return unless player_number.nil?
    Rails.logger.info(attributes)
    player_number = League.find(league_id).players&.maximum(:player_number)
    self.player_number = (player_number || 0) + 1
  end

  def ensure_pin
    return unless pin.blank?
    self.pin = sprintf("%06i", rand(1_000_000))
  end
end
