class SessionsController < Clearance::SessionsController

  # def destroy
  #   signed_in? == false
  #   redirect_to "/"
  # end

 def create
    @user = user_from_params

    if @user.save
      sign_in @user
      WelcomeJob.perform_later(@user.email)
      redirect_back_or url_after_create
    else
      render template: "users/new"
    end
  end
    
  def create_from_omniauth
    auth_hash = request.env["omniauth.auth"]
    authentication = Authentication.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"]) ||  Authentication.create_with_omniauth(auth_hash)

      # if: previously already logged in with OAuth
      if authentication.user
        user = authentication.user
        authentication.update_token(auth_hash)
        @next = home_path
        # @notice = "Signed in!"
      # else: user logs in with OAuth for the first time
      else
        user = User.create_with_auth_and_hash(authentication, auth_hash)
        WelcomeJob.perform_later(user.email)
        # you are expected to have a path that leads to a page for editing user details
        @next = edit_user_path(user)
        @notice = "User created. Please confirm or edit details"
      end

    sign_in(user)

    redirect_to @next, :notice => @notice
  end

end