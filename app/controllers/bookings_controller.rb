class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  private

  def booking_params
    params.require(:booking).permit(:starting_date, :end_date, :status)
  end
end
