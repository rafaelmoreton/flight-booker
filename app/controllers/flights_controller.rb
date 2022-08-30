class FlightsController < ApplicationController
  def new
  end

  def index
    @airport_options = Airport.all.map { |a| [a.code, a.id] }
    @datetime_options = Flight.all.map do |flight|
      flight.datetime.to_date
    end.uniq

    @passengers = params[:passengers]
     
    @flights = Flight.where("
      departure_id = ? AND
      arrival_id = ? AND
      date = ?
      ",
      params[:departure_id],
      params[:arrival_id],
      params[:datetime]
    )
  end
end
