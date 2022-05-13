require 'open-uri'
require 'json'

puts "clean database"
List.destroy_all
Movie.destroy_all

Movie.create(title: "Tokyo Stroy 1953", overview: "The elderly Shukishi (Chishu Ryu) and his wife, Tomi (Chieko Higashiyama), take the long journey from their small seaside village to visit their adult children in Tokyo.", poster_url: "https://i.mydramalist.com/Q76O6f.jpg", rating: 6.9)
Movie.create(title: "Le Havre 2011", overview: "An African boy arrives by cargo ship in the port city of Le Havre. At that time, an ageing shoeshiner pities the plight of the African child and welcomes him into his residence.", poster_url: "https://media.elcinema.com/uploads/_640x_eeb1a24670a0ba4ea219a98b6259d67862e2ea6963406ac51f55788a5061a139.jpg", rating: 8.7)
Movie.create(title: "Nomadland 2020", overview: "Fern gives up her home and starts life on the road as a nomad, after the company she worked for shuts down. She soon meets and bonds with fellow nomads who teach her important survival skills.", poster_url: "https://www.theglobalist.com/wordpress/wp-content/uploads/2021/05/nomadland-poster-e1620412556174.jpg", rating: 7.9)
Movie.create(title: "The Lives of Others (Das Leben der Anderen) 2006", overview: "Before the collapse of the Berlin Wall, pro-Socialist playwright Georg's flat is bugged to find incriminating evidence against him when a corrupt government official falls for his girlfriend.", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 7.0)
Movie.create(title: "TThe Green Ray 1986", overview: "Delphine (Marie Rivière) is a beautiful young Parisian who is still smarting from a recent break-up. When a friend nixes their travel plans shortly before the trip, Delphine is left to decide how to spend her holiday. Soon she is dealing with various uncomfortable situations, including a beach getaway where she is the only single person. After attempting a trip to the overcrowded Alps, Delphine entertains more vacation options, but will the restless soul ever find what she's looking for?", poster_url: "https://alchetron.com/The-Green-Ray-(film)#The-Green-Ray-film-images-21fd529e-87b3-40eb-81e4-de3f86d7700.jpg", rating: 7.0)
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
