# frozen_string_literal: true

class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.belongs_to :league, foreign_key: true
      t.integer :player_number
      t.string :player_name
      t.string :pin

      t.timestamps
    end

    add_index :players, %i[league_id player_number], unique: true
  end
end
