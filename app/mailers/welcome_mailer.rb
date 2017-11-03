class WelcomeMailer < ApplicationMailer

	def welcome_email(user_email)
		@user = User.find_by(email: user_email)

    @url  = 'http://isa-airbnb.herokuapp.com'
    mail(to: user_email, subject: 'Isa-airbnb: Welcome!')
  end

end
