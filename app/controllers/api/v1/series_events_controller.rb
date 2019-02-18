module Api
  module V1
    class SeriesEventsController < ApiController
      before_action :set_series_event, only: [:show, :checkin]
      before_action :authenticate_api_v1_user!, only: [:checkin]

      # GET /series_events
      def index
        @series_events = SeriesEvent.all

        render json: @series_events
      end

      # GET /series_events/1
      def show
        render json: @series_event
      end

      def checkin
        # authenticated user + league-series -> Player
        Rails.logger.info(params.inspect)
        render json: @series_event
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_series_event
        @series_event = SeriesEvent.find(params["id"] || params["series_event_id"])
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
