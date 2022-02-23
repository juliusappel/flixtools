class PagesController < ApplicationController
  def home
    @appliances = Appliance.all
  end

  def index
    @appliances = Appliance.all
  end

  def dashboard
    @bookings = Booking.where("user_id = '#{current_user.id}'")
    @appliances = Appliance.where("user_id = '#{current_user.id}'")
  end

  private

  def user
    @user = current_user
  end

end
