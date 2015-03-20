class ReservationsController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @reservations = Reservation.joins(restourant: :user).
    where(restourants: { user_id:  current_user.id })
  end

  def show

    @reservation = Reservation.find(params[:id])
  end

  def new
    @reservation = Reservation.new(restourant_id: params[:restourant_id])
  end

  def create()
    @reservation = Reservation.new(reservation_params)

    if @reservation.save && simple_captcha_valid? do
      # Tell the UserMailer to send a welcome email after save

      ReservationsMailer.send_reservation_confirm(@reservation).deliver_now
      redirect_to restourant_path(@reservation.restourant_id)
    else
      redirect_to  new_reservation_for_restourant_path(restourant_id: @reservation.restourant_id)# should work when @message.save is 'false'
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:last_name,:no_people,:datetime,:email,:restourant_id)
  end
end
