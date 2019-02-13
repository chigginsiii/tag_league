class LeagueSeriesSerializer < BaseSerializer
  attributes :id, :title, :date_start, :date_end
  has_many :series_events

  attributes :next_event, :current_event

  def next_event
    SeriesEventSerializer.new(object.next_event).serializable_hash
  end

  def current_event
    SeriesEventSerializer.new(object.current_event).serializable_hash
  end
end
