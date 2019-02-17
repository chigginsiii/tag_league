class CreateRoundPlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :round_players do |t|
      t.belongs_to :event_round, foreign_key: true
      t.belongs_to :player, foreign_key: true
      t.belongs_to :round_card, foreign_key: true
      t.integer :score

      t.timestamps
    end

    add_index :round_players, [:event_round_id, :player_id], unique: true
  end
end
