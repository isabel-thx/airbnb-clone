class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :upgrade]

  def show
    # @user = User.find(params[:id])
    # automatically renders template: "users/show" (controller/action)
    # if params[:user_id]
      @listings = @user.listings.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)

    # else
    #   @listings = Listing.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
    # end
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

  def upgrade
    @user.moderator!
    redirect_to @user
  end

  def index
    @users = User.all
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end

  def set_user
     @user = User.find(params[:id])
  end

end