module Api
  module V1
    class EventRoundsController < ApiController
      def show
        if event_round
          render json: event_round.attributes, status: :ok
        else
          render json: { message: "not found" }, status: :not_found
        end
      end

      private

      def event_round
        @event_round ||= EventRound.find(round_params[:id])
      end

      def round_params
        params.permit(:id)
      end
    end
  end
end
