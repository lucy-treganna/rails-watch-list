# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
response = HTTParty.get('http://tmdb.lewagon.com/movie/top_rated')

response['results'].first(10).each do |result|
  title = result['original_title']
  overview = result['overview']
  base_url = 'https://image.tmdb.org/t/p/w500'
  poster_url = "#{base_url}#{result['poster_path']}"
  rating = result['vote_average']
  Movie.create!(title: title, rating: rating, overview: overview, poster_url: poster_url)
end
