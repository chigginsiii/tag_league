class LeagueSerializer < BaseSerializer
  attributes :id, :name
  link(:self) { |obj| league_url(obj, only_path: true) }
end
