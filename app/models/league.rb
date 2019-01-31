# frozen_string_literal: true

class League < ApplicationRecord
  has_many :league_series, dependent: :destroy
  has_many :players, dependent: :destroy
end
