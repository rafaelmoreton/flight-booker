# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Airport::delete_all
airports = [
  Airport.create(code: "NYC"),
  Airport.create(code: "GRU"),
  Airport.create(code: "SFO"),
  Airport.create(code: "FRA"),
  Airport.create(code: "BCN"),
  Airport.create(code: "BUE"),
  Airport.create(code: "HKG")
]

# Create a flight for day for a year, from each airport to each other airport
Flight::delete_all
dates = Array(Date.today..Date.today.next_month)
dates.each do |date|
  airports.each do |departure_airport|
    airports.reject { |a| a == departure_airport }.each do |arrival_airport|
      Flight.create(
        departure: departure_airport,
        arrival: arrival_airport,
        date: date
      )
    end
  end  
end
