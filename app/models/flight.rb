class Flight < ApplicationRecord
  belongs_to :departure, class_name: "Airport"
  belongs_to :arrival, class_name: "Airport"

  has_many :bookings
  has_many :passengers, through: :bookings

  def full_info
    <<~FLIGHT_INFO
    TIME: #{datetime}
    FLIGHT_INFO
  end
end
