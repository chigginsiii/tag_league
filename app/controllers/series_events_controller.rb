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

  # POST /series_events
  def create
    @series_event = SeriesEvent.new(series_event_params)

    if @series_event.save
      render json: @series_event, status: :created, location: @series_event
    else
      render json: @series_event.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /series_events/1
  def update
    if @series_event.update(series_event_params)
      render json: @series_event
    else
      render json: @series_event.errors, status: :unprocessable_entity
    end
  end

  # DELETE /series_events/1
  def destroy
    @series_event.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_series_event
    @series_event = SeriesEvent.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def series_event_params
    params.require(:series_event).permit(:title, :event_start_time, :event_end_time)
  end
end
