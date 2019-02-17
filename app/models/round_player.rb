class RoundPlayer < ApplicationRecord
  belongs_to :event_round
  belongs_to :player
  belongs_to :round_card
end
