# frozen_string_literal: true

class LeaguesController < ApiController
  before_action :set_league, only: %i[show update destroy]

  # GET /leagues
  def index
    @leagues = League.all

    render json: LeagueSerializer.new(@leagues, is_collection: true).serialized_json
  end

  # GET /leagues/1
  def show
    render json: @league.to_json(include: :league_series)
  end

  # POST /leagues
  def create
    @league = League.new(league_params)

    if @league.save
      render json: @league, status: :created, location: @league
    else
      render json: @league.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /leagues/1
  def update
    if @league.update(league_params)
      render json: @league
    else
      render json: @league.errors, status: :unprocessable_entity
    end
  end

  # DELETE /leagues/1
  def destroy
    @league.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_league
    @league = League.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def league_params
    params.require(:league).permit(:name)
  end
end
