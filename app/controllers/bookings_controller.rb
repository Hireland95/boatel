class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @boat = Boat.find(params[:boat_id])
    @disabled_dates = Booking.where(boat: @boat).pluck(:booking_date, :enddate).map { |dates| (dates[0]..dates[1]).to_a }.flatten
  end

  def create
    @boat = Boat.find(params[:boat_id])
    @user = current_user
    result = booking_params
    @booking = Booking.new
    @booking.booking_date = Date.parse(result[0])
    @booking.enddate = Date.parse(result[1])
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
    range = params.require(:booking).permit(:booking_date)
    startend = range[:booking_date].split(" ")
    return [startend[0], startend[2]]
  end
end
