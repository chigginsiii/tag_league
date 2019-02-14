class CreateEventRounds < ActiveRecord::Migration[5.2]
  def change
    create_table :event_rounds do |t|
      t.belongs_to :series_event, null: false, foreign_key: true
      t.belongs_to :course, foreign_key: true
      t.integer :round_num, null: false, default: 1
      t.timestamps
    end

    add_index :event_rounds, [:series_event_id, :round_num], unique: true
  end
end
