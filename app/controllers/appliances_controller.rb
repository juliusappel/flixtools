class AppliancesController < ApplicationController
  before_action :set_appliance, only: %i[show]
  before_action :set_owner, only: %i[edit update destroy]
  before_action :authorize_appliance, except: %i[index new create]
  after_action :authorize_appliance, only: %i[new create]

  def index
    @appliances = policy_scope(Appliance).order(created_at: :desc)
  end

  def show
    # Set empty booking form
    @booking = Booking.new

    # Set marker for Mapbox map
    @markers =
      [{
        lat: @appliance.latitude,
        lng: @appliance.longitude
      }]
  end

  def new
    @appliance = Appliance.new
  end

  def create
    @appliance = Appliance.new(appliance_params)
    @appliance.user_id = current_user.id

    if @appliance.save!
      redirect_to @appliance, notice: "Your appliance was successfully listed."
    else
      render :new
    end
  end

  def edit
  end

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

    if @appliance.destroy
      redirect_to dashboard_path, notice: "Your appliance was successfully deleted."
    else
      render :show
    end
  end

  private

  def set_appliance
    @appliance = Appliance.find(params[:id])
  end

  def set_owner
    set_appliance
    @owner = @appliance.user_id
  end

  def appliance_params
    params.require(:appliance).permit(:title, :description, :price, :location, photos: [])
  end

  def authorize_appliance
    authorize @appliance
  end
end
