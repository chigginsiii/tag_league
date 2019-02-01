class RenameEventPlayer < ActiveRecord::Migration[5.2]
  def change
    rename_table :event_players, :player_events
  end
end
