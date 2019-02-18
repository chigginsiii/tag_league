class AddPlayerNameToPlayer < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :player_name, :string
    add_column :players, :player_number, :integer, not_null: true

    add_index :players, [:league_id, :player_number], unique: true
  end
end
