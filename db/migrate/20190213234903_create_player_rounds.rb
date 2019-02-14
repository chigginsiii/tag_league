class CreatePlayerRounds < ActiveRecord::Migration[5.2]
  def change
    create_table :player_rounds do |t|
      t.belongs_to :player, foreign_key: true, null: false
      t.belongs_to :event_round, foreign_key: true, null: false

      t.timestamps
    end
  end
end
