class Flight < ApplicationRecord
  belongs_to :departure, class_name: "Airport"
  belongs_to :arrival, class_name: "Airport"

  has_many :bookings
  has_many :passengers, through: :bookings

  def time_info
    <<~FLIGHT_INFO
    Time: #{0 if datetime.hour < 10}#{datetime.hour}:#{0 if datetime.min < 10}#{datetime.min}
    FLIGHT_INFO
  end
end
