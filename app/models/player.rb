class Player < ApplicationRecord
  # authentication:
  # - not all players have to have users to login, but...
  # - in order to start/run a card, someone's gotta auth.
  # the person running the card on their phone, at least,
  # has ot have an account to login with.
  #
  # that way:
  # - auth user does login and starts the card
  # - other players can join with their player number and pin
  #
  belongs_to :user

  # the club
  belongs_to :league

  # this season's tag league
  has_many :series_players
  has_many :league_series, through: :series_players

  # event status, which round, etc
  has_many :player_events, inverse_of: :player
  accepts_nested_attributes_for :player_events
  has_many :series_events, through: :player_events
  # score for a round, card
  has_many :player_rounds
  has_many :event_rounds, through: :player_rounds

  before_validation :ensure_player_number
  before_validation :ensure_pin

  validates_associated :league
  validates :player_number,
    numericality: { only_integer: true, greater_than_or_equal_to: 1 },
    uniqueness: { scope: :league }

  validates :player_name,
    presence: true,
    uniqueness: { scope: :league }

  validates_format_of :pin, with: /\A\d{6}\Z/

  private

  def ensure_player_number
    return unless player_number.nil?
    player_number = League.find(league_id).players&.maximum(:player_number)
    self.player_number = (player_number || 0) + 1
  end

  def ensure_pin
    return unless pin.blank?
    self.pin = sprintf("%06i", rand(1_000_000))
  end
end
