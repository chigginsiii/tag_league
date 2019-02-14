class EventRound < ApplicationRecord
  belongs_to :series_event
  belongs_to :course
  has_many :player_rounds, dependent: :destroy
  accepts_nested_attributes_for :player_rounds
  has_many :players, through: :player_rounds
end
