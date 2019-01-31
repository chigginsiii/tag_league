class Player < ApplicationRecord
  belongs_to :league

  before_validation :ensure_pin
  before_validation :ensure_player_number

  validates_associated :league
  validates :player_number,
    numericality: { only_integer: true, greater_than_or_equal_to: 1 },
    uniqueness: { scope: :league }

  validates :display_name, presence: true
  validates_format_of :pin, with: /\A\d{6}\Z/

  private

  def ensure_player_number
    return unless player_number.nil?
    self.player_number = (league.players.maximum(:player_number) || 0) + 1
  end

  def ensure_pin
    return unless pin.blank?
    self.pin = sprintf('%06i', rand(1_000_000))
  end
end
