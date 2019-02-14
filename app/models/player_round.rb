class PlayerRound < ApplicationRecord
  belongs_to :player
  belongs_to :event_round
end
