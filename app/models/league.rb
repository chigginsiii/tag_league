class League < ApplicationRecord
  has_many :league_series, dependent: :destroy
end
