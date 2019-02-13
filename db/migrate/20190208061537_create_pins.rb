class CreatePins < ActiveRecord::Migration[5.2]
  def change
    create_table :pins do |t|
      t.string :label, null: false
      t.integer :distance_value
      t.string :distance_unit
      t.integer :par
      t.belongs_to :hole

      t.timestamps
    end

    add_index :pins, [:label, :hole_id], unique: true
  end
end
