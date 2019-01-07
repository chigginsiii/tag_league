class LeagueSeriesController < ApplicationController
  before_action :set_league_series, only: [:show, :update, :destroy]

  # GET /league_series
  def index
    @league_series = LeagueSeries.all

    render json: @league_series
  end

  # GET /league_series/1
  def show
    render json: @league_series
  end

  # POST /league_series
  def create
    @league_series = LeagueSeries.new(league_series_params)

    if @league_series.save
      render json: @league_series, status: :created, location: @league_series
    else
      render json: @league_series.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /league_series/1
  def update
    if @league_series.update(league_series_params)
      render json: @league_series
    else
      render json: @league_series.errors, status: :unprocessable_entity
    end
  end

  # DELETE /league_series/1
  def destroy
    @league_series.destroy
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
