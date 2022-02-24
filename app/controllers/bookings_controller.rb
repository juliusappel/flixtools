class BookingsController < ApplicationController
  after_action :authorize_booking, only: %i[create]

  def create
    @booking = Booking.new(booking_params)
    @booking.user_id = current_user.id
    @booking.appliance = Appliance.find(params[:appliance_id])


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

  def authorize_booking
    authorize @booking
  end
end
