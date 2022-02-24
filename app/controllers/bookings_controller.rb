class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    @booking.user_id = current_user.id
    @booking.appliance_id = Appliance.find(params[:id])

    if @booking.save!
      redirect_to dashboard_path
    else
      render root_path
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
