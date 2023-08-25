class BoatsController < ApplicationController
  def index
    @boats = Boat.all
    @boat_types = ["Speedboat", "Yacht", "Cruise Ship", "Pirate Ship", "Canoe", "Rowing Boat", "Submarine", "Other"]
    @details = ["Electricity", "GPS", "Oars", "Wifi", "Kitchen", "Washing Machine", "Life Jackets", "Butler"]
    # Search filter logic
    if params[:boat_type].nil? && params[:max_price].nil?
      @select = @boats
    elsif params[:boat_type] != "none" && params[:max_price] != "none"
      @select = @boats.select { |boat| boat.boat_type == params[:boat_type] && boat.price <= params[:max_price].to_f }
    elsif params[:boat_type] != "none"
      @select = @boats.select { |boat| boat.boat_type == params[:boat_type] }
    elsif params[:max_price] != "none"
      @select = @boats.select { |boat| boat.price <= params[:max_price].to_f }
    else
      @select = @boats
    end
  end

  def show
    @boat = Boat.find_by(id: params[:id])
    if @boat.nil?
      flash[:alert] = "Boat not found"
      redirect_to boats_path
    end

    @boats = Boat.all
    coordinates = @boat.geocode
    @markers = [{
      lat: coordinates[0],
      lng: coordinates[1],
      info_window_html: render_to_string(partial: "info_window", locals: {boat: @boat}),
      marker_html: render_to_string(partial: "marker")
    }]
  end

  def new
    @boat = Boat.new
    @details = ["Electricity", "GPS", "Oars", "Wifi", "Kitchen", "Washing Machine", "Life Jackets", "Butler"]
    @boat_types = ["Speedboat", "Yacht", "Cruise Ship", "Pirate Ship", "Canoe", "Rowing Boat", "Submarine", "Other"]
  end

  def create
    @boat = Boat.new(boat_params[0])
    @boat.details = boat_params[1][:details].join("-")
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
    @details = ["Electricity", "GPS", "Oars", "Wifi", "Kitchen", "Washing Machine", "Life Jackets", "Butler"]
  end

  def update
    @boat = Boat.find(params[:id])
    @boat.update(boat_params[0])
    @boat.update({details: boat_params[1][:details].join("-") })
    @boats = Boat.all
    @markers = @boats.geocoded.map do |boat|
      {lat: boat.latitude,
        lng: boat.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {boat: boat}),
        marker_html: render_to_string(partial: "marker")
      }
    end
    redirect_to boat_path(@boat)
  end

  def destroy
    @boat = Boat.find(params[:id])
    @boat.destroy
    redirect_to boats_path, notice: 'Boat was successfully deleted.', status: :see_other
  end

  private

  def boat_params
    return [params.require(:boat).permit(:name, :address, :price, :boat_type, photos: []), params.require(:boat).permit(details: [])]
  end

end
