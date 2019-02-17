class CreateRoundCards < ActiveRecord::Migration[5.2]
  def change
    create_table :round_cards do |t|
      t.belongs_to :event_round, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
