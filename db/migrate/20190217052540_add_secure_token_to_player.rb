class AddSecureTokenToPlayer < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :token, :string
    add_index :players, :token, unique: true
  end
end
