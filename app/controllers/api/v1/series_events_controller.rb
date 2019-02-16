module Api
  module V1
    class SeriesEventsController < ApplicationController
      before_action :set_series_event, only: [:show, :update, :destroy]

      # GET /series_events
      def index
        @series_events = SeriesEvent.all

        render json: @series_events
      end

      # GET /series_events/1
      def show
        render json: @series_event
      end

      def login
        render json: { message: "unauthorized" }, status: :unauthorized
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
    end
  end
end
