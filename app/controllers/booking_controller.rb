class BookingController < ApplicationController
  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
