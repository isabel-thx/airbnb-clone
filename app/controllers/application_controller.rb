class ApplicationController < ActionController::Base
  include Clearance::Controller
  protect_from_forgery with: :exception

  # def allowed?(user, action)
  #   if user.customer? 
  #   	return true if action == edit || delete 
  #   elsif user.moderator?
  #   	return true if action == verify
  #   elsif user.superadmin?
  #   	return true if action == verify
  #   end
  # end
end

