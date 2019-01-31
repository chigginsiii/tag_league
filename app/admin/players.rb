ActiveAdmin.register Player do
  permit_params :league_id, :display_name, :player_number
end
