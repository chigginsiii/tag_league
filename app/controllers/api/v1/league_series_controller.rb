# frozen_string_literal: true

module Api
  module V1
    class LeagueSeriesController < ApiController
      before_action :set_league_series, only: %i[show update destroy]

      # GET /league_series
      def index
        @league_series = LeagueSeries.all

        render json: @league_series
      end

      # GET /league_series/1
      def show
        render json: @league_series
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_league_series
        @league_series = LeagueSeries.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def league_series_params
        params.require(:league_series).permit(:title, :date_start, :date_end, :belongs_to)
      end
    end
  end
end
