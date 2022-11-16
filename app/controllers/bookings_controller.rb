class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
    @tool = @booking.tool # grabs tool_id
  end

  def new
    @tool = Tool.find(params[:tool_id]) # grab id
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.tool_id = params[:tool_id]
    @booking.user = current_user

    if @booking.save
      redirect_to bookings_path(@booking.tool)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])

    @booking.destroy
    # raise

    redirect_to bookings_path(@booking.tool), status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:starting_date, :end_date, :tool_id, :user_id)
  end
end
