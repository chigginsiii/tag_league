class RemovePlayerColumns < ActiveRecord::Migration[5.2]
  def change
    remove_column :players, :player_number, :integer
    remove_column :players, :player_name, :string
    remove_column :players, :token, :string

    add_reference :players, :user, foreign_key: true, index: true
  end
end
