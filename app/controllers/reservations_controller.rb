class ReservationsController < ApplicationController
  def create
    @reservation = current_user.reservations.create(reservation_params)

    redirect_to @reservation.listing, notice:"予約が完了しました"
  end

  private
  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :price_pernight, :total_price, :listing_id)
  end
end
