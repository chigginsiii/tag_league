module Api
  module V1
    class SeriesEventsController < ApplicationController
      before_action :set_series_event, only: [:show, :update]

      # GET /series_events
      def index
        @series_events = SeriesEvent.all

        render json: @series_events
      end

      # GET /series_events/1
      def show
        render json: @series_event
      end

      def signin
        league_series = SeriesEvent.find(signin_param[:series_event_id])
        return render json: { message: "series not found" }, status: :not_found unless league_series

        player = league_series.players.find_by(signin_params.slice("player_number", "pin"))
        if player
          render json: { token: player.token }, status: :ok
        else
          render json: { message: "unauthorized" }, status: :unauthorized
        end
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_series_event
        @series_event = SeriesEvent.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def series_event_params
        params.require(:series_event).permit(:league_series_id, :title, :event_start_time, :event_end_time)
      end

      def signin_params
        params.permit(:series_event_id, :player_number, :player_pin)
      end
    end
  end
end
