class CreateEventPlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :event_players do |t|
      t.belongs_to :series_event, foreign_key: true
      t.belongs_to :player, foreign_key: true

      t.timestamps
    end

    add_index :event_players, [:series_event_id, :player_id], unique: true
  end
end
