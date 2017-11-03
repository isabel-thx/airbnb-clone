class WelcomeJob < ApplicationJob
  queue_as :default

  def perform(cust_email)
     WelcomeMailer.welcome_email(cust_email).deliver_now
  end

end
