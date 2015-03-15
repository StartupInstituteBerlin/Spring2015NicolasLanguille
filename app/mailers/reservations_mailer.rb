class ReservationsMailer < ApplicationMailer

  def send_reservation_confirm(reservation)
    @reservation = reservation
    mail(to: @reservation.email, subject: 'Your reservation succeded')
  end

end
