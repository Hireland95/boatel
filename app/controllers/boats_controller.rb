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
  end

  def update
    @boat = Boat.find(params[:id])
    @boat.update(boat_params)
    redirect_to boat_path(@boat)
  end

  def destroy
    @boat = Boat.find(params[:id])
    @boat.destroy

    redirect_to boats_path, notice: 'Boat was successfully deleted.'
  end

  private

  def boat_params
    params.require(:boat).permit(:name, :address, :price, :photo)
  end
end
