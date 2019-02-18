# frozen_string_literal: true

ActiveAdmin.register League do
  permit_params :name

  show do
    columns do
      column do
        panel "Details" do
          attributes_table_for league do
            row("Name", &:name)
          end
        end
        panel "Series" do
          table_for league.league_series do
            column do |series|
              link_to series.title, admin_league_league_series_path(league, series)
            end
            column "Start", :date_start
            column "Ends", :date_end
          end
        end
      end
      column do
        panel "Players" do
          table_for league.players do
            column(&:player_name)
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
