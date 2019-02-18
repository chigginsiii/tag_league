# frozen_string_literal: true

ActiveAdmin.register LeagueSeries do
  belongs_to :league
  permit_params :title, :date_start, :date_end, :league_id

  member_action :add_player, method: :put do
    player_params = params.permit(:player_id)
    resource.series_players.create! player_params
    redirect_to admin_league_league_series_path(
      league_series_id: params[:league_series_id],
      id: params[:id]
    ), notice: "Added Player"
  end

  show do
    attributes_table do
      row :title
      row :date_start
      row :date_end
      row :league
    end

    columns do
      column do
        panel "Player Standings" do
          players_to_add = league.players - league_series.players
          if !players_to_add.empty?
            form action: add_player_admin_league_league_series_path(league_series, resource), method: :post do |_f|
              select name: :player_id do
                (league.players - league_series.players).map do |p|
                  option value: p.id do
                    p.player_name
                  end
                end
              end
              input name: "authenticity_token", type: :hidden, value: form_authenticity_token.to_s
              input type: :hidden, name: "_method", value: "put"
              input type: :submit, value: "Add Player to Series"
            end
          else
            para do
              "[no players to add]"
            end
          end
          table_for league_series.players do
            column "Name", :player_name
            column "League Number", :player_number
            column do |player|
              link_to "VIEW", [:admin, player]
            end
          end
        end
      end

      column do
        panel "Events" do
          para do
            link_to "New Event", new_admin_league_series_event_path(resource)
          end
          table_for league_series.series_events do
            column do |event|
              link_to event.title, admin_league_series_event_path(resource, event)
            end
            column "Start", :event_start_time
            column "End", :event_end_time
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
