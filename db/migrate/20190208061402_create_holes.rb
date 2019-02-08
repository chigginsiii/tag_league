class CreateHoles < ActiveRecord::Migration[5.2]
  def change
    create_table :holes do |t|
      t.integer :position, null: false
      t.string :label
      t.belongs_to :course, foreign_key: true

      t.timestamps
    end

    add_index :holes, [:position, :course_id], unique: true
  end
end
