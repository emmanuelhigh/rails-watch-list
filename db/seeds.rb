# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'uri'
require 'json'

Movie.destroy_all

def retrieve_movies
  url = "http://tmdb.lewagon.com/movie/top_rated"
  api_results = URI.open(url).read
  movies_api = JSON.parse(api_results)
  movies = movies_api["results"]
  movies.each do |m|
    title =  m['title']
    rating =  m['vote_average']
    overview =  m['overview']
    poster_url =  m['backdrop_path']
    p title
    p rating
    p overview
    p poster_url
    movie = Movie.new(title: title, overview: overview, poster_url: poster_url, rating: rating)
    movie.save!
    puts 'created one movie .......'
  end
  puts 'seeding done ....'
end

retrieve_movies
