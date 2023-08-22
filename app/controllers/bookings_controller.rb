class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @boat = Boat.find(params[:boat_id])
  end

  def create
    @boat = Boat.find(params[:boat_id])
    @user = current_user
    @booking = Booking.new(booking_params)
    @booking.user = @user
    @booking.boat = @boat
    if @booking.save
      redirect_to(user_path(@user))
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:booking_date, :enddate)
  end
end
