after 'development:league' do
  league = League.find_by(name: 'Test League')
  league.league_series.create!(
    title: 'Test Series',
    date_start: Date.parse('2019-01-01'),
    date_end: Date.parse('2019-12-31')
  )
end
