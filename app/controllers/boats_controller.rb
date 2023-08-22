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
  end

  def edit
  end

  def update
  end
end
