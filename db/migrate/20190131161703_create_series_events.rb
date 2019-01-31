class CreateSeriesEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :series_events do |t|
      t.belongs_to :league_series, index: true, foreign_key: true
      t.string :title
      t.datetime :event_start_time
      t.datetime :event_end_time

      t.timestamps
    end

    add_index :series_events, [:league_series_id, :title], unique: true
  end
end
