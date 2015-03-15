class ReservationsController < ApplicationController
    before_action :authenticate_user!, except: [:new, :create]

  def index

       user_restourant_ids = Restourant.where(user_id: current_user.id ).pluck(:id)
       @reservations = Reservation.where(restourant_id: user_restourant_ids)

  end

  def show

    @reservation = Reservation.find(params[:id])
  end

  def new
    @reservation = Reservation.new(restourant_id: params[:restourant_id])
  end

  # def destroy
  #   @reservation = reservations.find(params[:id])
  #   @reservation.destroy
  #
  #   redirect_to reservations_path
  #
  # end

  def create()
    @reservation = Reservation.new(reservation_params)

    if @reservation.save
      # Tell the UserMailer to send a welcome email after save

      ReservationsMailer.send_reservation_confirm(@reservation).deliver_now
      redirect_to restourant_path(@reservation.restourant_id)
    else
      render 'edit' # should work when @message.save is 'false'
    end
  end

  private

    def reservation_params
      params.require(:reservation).permit(:last_name,:no_people,:datetime,:email,:restourant_id)
    end
end
