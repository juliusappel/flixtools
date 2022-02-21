class ApplianceController < ApplicationController
  before_action :set_appliance, only: %i[show]
  before_action :set_owner, only: %i[edit update destroy]

  def index
    @appliances = Appliance.all
  end

  def show; end

  def new
    @appliance = Appliance.new
  end

  def create

  end

  def edit; end

  def update

  end

  def destroy
    @appliance.destroy

    respond_to do |format|
      format.html { redirect_to appliances_url, notice: "Appli was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_appliance
    @appliance = Appliance.find(params[:id])
  end

  def set_owner
    set_appliance
    @owner = appliance.user_id
  end

  def appliance_params
    params.require(:appliance).permit(:title, :description, :price, :location)
  end
end
