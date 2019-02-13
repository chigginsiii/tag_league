class LeagueSerializer < BaseSerializer
  attributes :id, :name
  attributes :league_series

  def league_series
    LeagueSeriesSerializer.new(object.current_series).serializable_hash
  end
end
