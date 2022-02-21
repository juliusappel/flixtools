class PagesController < ApplicationController
  def home
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
