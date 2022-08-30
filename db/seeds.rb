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

# Create a random number between 1 and 5 of flights for each day for a month,
# from each airport to each other airport, each with a random departure time
Flight::delete_all
datetimes = Array(DateTime.now..DateTime.now.next_month)
datetimes.each do |datetime|
  airports.each do |departure_airport|
    airports.reject { |a| a == departure_airport }.each do |arrival_airport|
      rand(1..5).times do
        Flight.create(
          departure: departure_airport,
          arrival: arrival_airport,
          datetime: datetime,
          date: datetime.to_date.to_s
        )
      end
    end
  end
end
