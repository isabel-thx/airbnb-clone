class ReservationMailer < ApplicationMailer

	def booking_email(guest_email, host_email)
		@guest = User.find_by(email: guest_email)
		@host = User.find_by(email: host_email)

    @url  = 'http://isa-airbnb.herokuapp.com'
    mail(to: host_email, subject: 'Isa-airbnb: You Have a New Booking!')
  end

end
