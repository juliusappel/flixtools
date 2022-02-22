class AppliancesController < ApplicationController
  before_action :set_appliance, only: %i[show]
  before_action :set_owner, only: %i[edit update destroy]
  before_action :authorize_appliance

  def index
    @appliances = policy_scope(Appliance).order(created_at: :desc)
  end

  def show
    @booking = Booking.new
  end

  def new
    @appliance = Appliance.new
  end

  def create
    @appliance = Appliance.new(appliance_params)

    respond_to do |format|
      if @appliance.save
        format.html { redirect_to appliance_url(@appliance), notice: "Appliance was successfully created." }
        format.json { render :show, status: :created, location: @appliance }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @appliance.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit; end

  def update
    respond_to do |format|
      if @appliance.update(appliance_params)
        format.html { redirect_to appliance_url(@appliance), notice: "Appliance was successfully updated." }
        format.json { render :show, status: :ok, location: @appliance }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @appliance.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @appliance.destroy

    respond_to do |format|
      format.html { redirect_to appliances_url, notice: "Appliance was successfully destroyed." }
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

  def authorize_appliance
    authorize @appliance
  end
end
