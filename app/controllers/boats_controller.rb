class BoatsController < ApplicationController
  def index
    @boats = Boat.all
  end

  def show
    @boat = Boat.find_by(id: params[:id])
    if @boat.nil?
      flash[:alert] = "Boat not found"
      redirect_to boats_path
    end
  end

  def new
    @boat = Boat.new
    @boat_types = ["Speedboat", "Yacht", "Cruise Ship", "Pirate Ship", "Canoe", "Rowing Boat", "Submarine", "Other"]
  end

  def create
    @boat = Boat.new(boat_params)
    @boat.user = current_user
    if @boat.save
      redirect_to boat_path(@boat)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @boat = Boat.find(params[:id])
    @boat_types = ["Speedboat", "Yacht", "Cruise Ship", "Pirate Ship", "Canoe", "Rowing Boat", "Submarine", "Other"]
  end

  def update
    @boat = Boat.find(params[:id])
    @boat.update(boat_params)
    redirect_to boat_path(@boat)
  end

  def destroy
    @boat = Boat.find(params[:id])
    @boat.destroy
    redirect_to boats_path, notice: 'Boat was successfully deleted.', status: :see_other
  end

  private

  def boat_params
    params.require(:boat).permit(:name, :address, :price, :details, :boat_type, photos: [])
  end
end
