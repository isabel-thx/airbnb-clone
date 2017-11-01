class ReservationJob < ApplicationJob
  queue_as :default

  def perform(cust_email, host_email)
     ReservationMailer.booking_email(cust_email, host_email).deliver_now
  end

end
