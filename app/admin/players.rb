ActiveAdmin.register Player do
  permit_params :league_id, :player_name, :player_number
end
