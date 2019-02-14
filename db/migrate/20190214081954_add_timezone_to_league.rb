class AddTimezoneToLeague < ActiveRecord::Migration[5.2]
  def change
    add_column :leagues, :timezone, :string, default: "America/Los Angeles"
  end
end
