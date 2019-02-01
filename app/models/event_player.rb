class EventPlayer < ApplicationRecord
  belongs_to :series_event
  belongs_to :player

  validates_associated :series_event
  validates_associated :player
  validates :player, uniqueness: { scope: :series_event }
end
