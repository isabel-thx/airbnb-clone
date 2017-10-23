class UsersController < ApplicationController

  def edit
    @user = User.find(params[:id])  #(params.require(:user).permit(:id))
    # automatically renders template: "users/edit" (controller/action)
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end

end