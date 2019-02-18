after "development:league", "development:series" do
  league = League.find_by(name: "Test League")
  league.players.destroy_all

  player1 = league.players.create!(
    player_name: "Alice",
    pin: "111111",
    league: league
  )

  player2 = league.players.create!(
    player_name: "Bob",
    pin: "222222",
    league: league
  )

  series = LeagueSeries.find_by(title: "Test Series")
  series.series_players.create!(player: player1)
  series.series_players.create!(player: player2)
end
