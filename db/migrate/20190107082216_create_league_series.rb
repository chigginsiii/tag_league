# frozen_string_literal: true

class CreateLeagueSeries < ActiveRecord::Migration[5.2]
  def change
    create_table :league_series do |t|
      t.string :title
      t.date :date_start
      t.date :date_end
      t.belongs_to :league

      t.timestamps
    end
  end
end
