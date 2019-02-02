ActiveAdmin.register SeriesEvent, as: 'Event' do
  belongs_to :league_series
  permit_params :title, :event_start_time, :event_end_time, player_events_attributes: []

  controller do
    def add_player
      @event = SeriesEvent.find(params[:id])
      @event.player_events.create!(player_id: params[:player_id])
    end
  end

  member_action :add_player, method: :put do
    resource.add_player
    redirect_to resource_path, notice: 'Added Player'
  end

  show do
    columns do
      column do
        panel 'Details' do
          attributes_table_for event do
            row('Start Time', &:event_start_time)
            row('End Time', &:event_end_time)
          end
        end
      end
      column do
        panel 'Players' do
          h3 'Add Player'
          table_for event.players do
            column(&:player_number)
            column(&:display_name)
          end
        end
      end
    end
  end
end
