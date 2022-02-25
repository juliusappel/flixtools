class PagesController < ApplicationController
  def home
    @appliances = Appliance.all
    if params[:query]
      @appliances = Appliance.search(params[:query])
    end
  end

  def index
    @appliances = Appliance.all
  end

  def dashboard
    @bookings = Booking.where("user_id = '#{current_user.id}'")

    @appliances = Appliance.where("user_id = '#{current_user.id}'")
    @user = current_user
  end

  def destroy
    @appliance = Appliance.find(params[:id])
    @owner = @appliance.user_id
    @appliance.destroy

    if @appliance.destroy
      redirect_to dashboard_path, notice: "Your appliance was successfully deleted."
    else
      render :show
    end
  end

  private

  def user
    @user = current_user
  end

end
