# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if Rails.env.development?
  AdminUser.where(email: 'admin@example.com').destroy_all
  AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

  League.where(name: 'Test League').destroy_all
  league = League.create!(name: 'Test League')
  league.league_series.create!(title: 'Test Series', date_start: Date.parse('2019-01-01'), date_end: Date.parse('2019-12-31'))
end
