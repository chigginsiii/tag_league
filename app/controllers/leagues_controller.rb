# frozen_string_literal: true

class LeaguesController < ApiController
  before_action :set_league, only: %i[show]

  # GET /leagues
  def index
    @leagues = League.all
    render json: @leagues, root: "leagues", each_serializer: LeagueSerializer
  end

  # GET /leagues/1
  def show
    render json: @league
  end

  # bootstrap: non-authenticated for player
  def bootstrap

    # if there's a series happening, it has events
    # past events
    # current event
    # upcoming events
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_league
    @league = League.find(params[:id])
  end
end
