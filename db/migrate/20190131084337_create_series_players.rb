class CreateSeriesPlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :series_players do |t|
      t.references :league_series, foreign_key: true
      t.references :player, foreign_key: true

      t.timestamps
    end

    add_index :series_players, [:league_series_id, :player_id], unique: true
  end
end
