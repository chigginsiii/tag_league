# frozen_string_literal: true

FactoryBot.define do
  factory :player do
    player_name { "Discy McGolfFace" }
    league
    user
  end
end
