require 'open-uri'
require 'json'

puts "clean database"
Movie.destroy_all

Movie.create(title: "Tokyo Stroy 1953", overview: "The elderly Shukishi (Chishu Ryu) and his wife, Tomi (Chieko Higashiyama), take the long journey from their small seaside village to visit their adult children in Tokyo.", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9)
Movie.create(title: "Le Havre 2011", overview: "An African boy arrives by cargo ship in the port city of Le Havre. At that time, an ageing shoeshiner pities the plight of the African child and welcomes him into his residence.", poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", rating: 8.7)
Movie.create(title: "Nomadland 2020", overview: "Fern gives up her home and starts life on the road as a nomad, after the company she worked for shuts down. She soon meets and bonds with fellow nomads who teach her important survival skills.", poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg", rating: 7.9)
Movie.create(title: "The Lives of Others (Das Leben der Anderen) 2006", overview: "Before the collapse of the Berlin Wall, pro-Socialist playwright Georg's flat is bugged to find incriminating evidence against him when a corrupt government official falls for his girlfriend.", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 7.0)
# the Le Wagon copy of the API
url = 'http://tmdb.lewagon.com/movie/top_rated'
response = JSON.parse(URI.open(url).read)

response['results'].each do |movie_hash|
  Movie.create!(
    title: movie_hash["original_title"],
    overview: movie_hash["overview"],
    poster_url: "https://image.tmdb.org/t/p/w500" + movie_hash['poster_path'],
    rating: movie_hash["vote_average"]
  )
end

puts "#{Movie.count} created"
