class LeagueSerializer < BaseSerializer
  attributes :id, :name, :series

  def series
    object.current_series
  end
end
