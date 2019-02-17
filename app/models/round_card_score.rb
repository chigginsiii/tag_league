class RoundCardScore < ApplicationRecord
  belongs_to :round_card
  belongs_to :round_player
  belongs_to :hole
end
