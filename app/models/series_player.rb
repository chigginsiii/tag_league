class SeriesPlayer < ApplicationRecord
  belongs_to :league_series
  belongs_to :player
end
