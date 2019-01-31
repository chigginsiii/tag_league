# frozen_string_literal: true

ActiveAdmin.register LeagueSeries do
  permit_params :title, :date_start, :date_end, :league_id

  show do
    attributes_table do
      row :title
      row :date_start
      row :date_end
      row :league
    end
    panel 'Player Roster' do
      table_for league_series.players do
        column :player_number
        column :display_name
      end
    end
  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
