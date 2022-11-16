class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
    @tool = @booking.tool
  end

  def new
    @tool = Tool.find(params[:tool_id])
    @booking = Booking.new
  end

  def create
    @tool = Tool.find(params[:tool_id]) # find unique tool
    @booking = Booking.new(booking_param)
    @booking.tool = @booking

    if @booking.save
      redirect_to bookings_path(@tool)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path, status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:starting_date, :end_date)
  end
end
