# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'open-uri'
require 'json'

puts "Seeding data..."

TOP_RATED = 'https://tmdb.lewagon.com/movie/top_rated'
html_file = URI.open(TOP_RATED).read
sample = JSON.parse(html_file)


movies = sample['results']

movies.each do |movie|
  Movie.create(title: movie['title'], overview: movie['overview'], poster_url: movie['poster_path'], rating: movie['vote_average'])
end

puts "Seeding data completed"
