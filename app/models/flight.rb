class Flight < ApplicationRecord
  belongs_to :departure, class_name: "Airport"
  belongs_to :arrival, class_name: "Airport"

  has_many :bookings
  has_many :passengers, through: :bookings

  def time_info
    period = "AM"
    if datetime.hour >= 12
      twelve_hour_time = datetime.change(hour: datetime.hour - 12, min: datetime.min, offset: 0)
      period = "PM"
    else
      twelve_hour_time = datetime
    end
    if twelve_hour_time.hour == 0
      twelve_hour_time = twelve_hour_time.change(hour: 12, min: datetime.min, offset: 0)
    end
    "#{0 if twelve_hour_time.hour < 10}#{twelve_hour_time.hour}:#{0 if datetime.min < 10}#{twelve_hour_time.min} #{period}"
  end

  def flight_info
    <<~FLIGHT_INFO
      From: #{departure.code}
      To: #{arrival.code}
      Date: #{date}
      Time of departure: #{time_info}
    FLIGHT_INFO
  end
end
