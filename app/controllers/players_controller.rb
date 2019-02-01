class PlayersController < ApiController
  before_action :set_player, only: [:show, :update, :destroy]
  def index
    @players = Player.select(:id, :display_name)
    render json: @players
  end

  def show
    render json: @player.to_json(include: :league_series)
  end

  def create
    @player = Player.new(player_params)
    @player.league_id = params[:league_id] unless @player.league_id

    if @player.save
      render json: @player, status: :created, location: @player
    else
      render json: @player.errors, status: :unprocessable_entity
    end
  end

  def update
    if @player.update(player_params)
      render json: @player
    else
      render json: @player.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @player.destroy
  end

  def set_player
    @player = Player.find(params[:id])
  end

  def player_params
    params.require(:player).permit(:display_name, :pin, :league_id)
  end
end
