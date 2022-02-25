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

  def destroy
    set_owner
    @booking.destroy

    if @booking.destroy
      redirect_to dashboard_path, notice: "Your booking was successfully deleted."
    else
      render :show
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_owner
    set_booking
    @owner = @booking.user_id
  end
  # Only allow a list of trusted parameters through.

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def authorize_booking
    authorize @booking
  end
end
