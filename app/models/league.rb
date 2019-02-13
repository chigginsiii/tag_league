# frozen_string_literal: true

class League < ApplicationRecord
  has_many :players, dependent: :destroy
  has_many :league_series, dependent: :destroy

  def current_series
    league_series.where(':date BETWEEN date_start AND date_end', date: Date.current).first
  end
end
