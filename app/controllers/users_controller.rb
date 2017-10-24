class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update]

  def show
    # @user = User.find(params[:id])
    # automatically renders template: "users/show" (controller/action)
  end

  def edit
    # @user = User.find(params[:id])
  end

  def update
    # @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
      #redirect_to the obejct means goes to the show path of the object
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end

  def set_user
     @user = User.find(params[:id])
  end

end