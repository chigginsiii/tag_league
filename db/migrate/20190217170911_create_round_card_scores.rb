class CreateRoundCardScores < ActiveRecord::Migration[5.2]
  def change
    create_table :round_card_scores do |t|
      t.belongs_to :round_card, foreign_key: true
      t.belongs_to :round_player, foreign_key: true
      t.belongs_to :hole, foreign_key: true
      t.jsonb :hole_info

      t.timestamps
    end

    add_index :round_card_scores,
      [:round_card_id, :round_player_id, :hole_id],
      name: :round_card_player_hole_index,
      unique: true
  end
end
