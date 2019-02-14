ActiveAdmin.register SeriesEvent, as: "Event" do
  belongs_to :league_series
  permit_params :title, :event_start_time, :event_end_time,
    player_events_attributes: [:player_id],
    event_round_attributes: [:id, :course_id, :round_num]

  form do |f|
    f.inputs "Series: #{league_series.title}" do
      f.input :title, label: "Event Name"
      f.input :event_start_time
      f.input :event_end_time
    end

    actions
  end

  member_action :add_player, method: :put do
    player_params = params.permit(:player_id)
    resource.player_events.create! player_params
    redirect_to admin_league_series_event_path(
      league_series_id: params[:league_series_id],
      id: params[:id]
    ), notice: "Added Player"
  end

  member_action :remove_player, method: :delete do
    player = resource.player_events.find_by(player_id: params[:player_id])
    player.destroy!
    redirect_to admin_league_series_event_path(
      league_series_id: params[:league_series_id],
      id: params[:id]
    ), notice: "Removed Player"
  end

  member_action :add_round, method: :put do
    cur_round = resource.event_rounds.maximum(:round_num) || 0
    resource.event_rounds.create!(
      course_id: params[:course_id],
      round_num: cur_round + 1
    )

    redirect_to admin_league_series_event_path(
      league_series_id: params[:league_series_id],
      id: params[:id]
    ), notice: "Added Round"
  end

  member_action :remove_round, method: :delete do
    round = resource.event_rounds.find_by(id: params[:event_round_id])
    round.destroy!
    redirect_to admin_league_series_event_path(
      league_series_id: params[:league_series_id],
      id: params[:id]
    ), notice: "Removed Round"
  end

  show do
    columns do
      column do
        panel "Details" do
          attributes_table_for event do
            row("Start Time", &:event_start_time)
            row("End Time", &:event_end_time)
          end
        end
        panel "Rounds" do
          div do
            form action: add_round_admin_league_series_event_path(league_series, resource), method: :post do |_f|
              select name: :course_id do
                Course.all.map do |c|
                  option value: c.id do
                    c.name
                  end
                end
              end
              input type: :submit, value: "Add Round"
              input type: :hidden, name: "_method", value: "put"
              input type: :hidden, name: "authenticity_token", value: form_authenticity_token.to_s
            end
          end
          table_for event.event_rounds do
            column :round do |r|
              r.round_num
            end
            column :course do |r|
              r.course.name
            end
            column do |r|
              link_to "remove",
                remove_round_admin_league_series_event_path(
                  league_series, resource,
                  event_round_id: r.id,
                  authenticity_token: form_authenticity_token.to_s
                ),
                method: :delete
            end
          end
        end
      end
      column do
        panel "Players" do
          div do
            form action: add_player_admin_league_series_event_path(league_series, resource), method: :post do |_f|
              select name: :player_id do
                (league_series.players - event.players).map do |p|
                  option value: p.id do
                    "#{p.player_number} #{p.display_name}"
                  end
                end
              end
              input name: "authenticity_token", type: :hidden, value: form_authenticity_token.to_s
              input type: :hidden, name: "_method", value: "put"
              input type: :submit, value: "Add"
            end
          end
          table_for event.players do
            column(&:player_number)
            column(&:display_name)
            column do |p|
              link_to "remove",
                remove_player_admin_league_series_event_path(
                  league_series, resource,
                  player_id: p.id,
                  authenticity_token: form_authenticity_token.to_s
                ),
                method: :delete
            end
          end
        end
      end
    end
  end
end
