class BookingsController < ApplicationController
  def new
    cookies[:flight_id] = params[:flight_id]
    @booking = Booking.new(flight_id: cookies[:flight_id])
    params[:passengers].to_i.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.flight_id = cookies[:flight_id]

    if @booking.save
      redirect_to booking_path(@booking), notice: "Booking confirmed"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(passengers_attributes: [:name, :email])
  end
end
