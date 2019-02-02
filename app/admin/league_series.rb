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

    columns do
      column do
        panel 'Player Standings' do
          table_for league_series.players do
            column 'Name', :display_name
            column 'League Number', :player_number
            column do |player|
              link_to 'VIEW', [:admin, player]
            end
          end
        end
      end

      column do
        panel 'Events' do
          para do
            link_to 'New Event', new_admin_league_series_event_path(resource)
          end
          table_for league_series.series_events do
            column do |event|
              link_to event.title, admin_league_series_event_path(resource, event)
            end
            column 'Start', :event_start_time
            column 'End', :event_end_time
          end
        end
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
