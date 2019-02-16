module Api
  module V1
    class PlayersController < ApiController
      before_action :set_player, only: [:show, :update, :destroy]
      def index
        @players = Player.select(:id, :display_name)
        render json: @players
      end

      def show
        render json: @player.to_json(include: :league_series)
      end

      private

      def set_player
        @player = Player.find(params[:id])
      end

      def player_params
        params.require(:player).permit(:display_name, :pin, :league_id)
      end
    end
  end
end
