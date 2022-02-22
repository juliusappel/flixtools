class PagesController < ApplicationController
  def home
    @appliances = Appliance.all
  end

  def index
    @appliances = Appliance.all
  end

  def show_own_bookings
    @bookings = Booking.where("user_id = '#{current_user.id}'")
  end

  def active_listings
    @appliances = Appliance.where("user_id = '#{current_user.id}'")
  end

  private

  def user
    @user = current_user
  end

end
