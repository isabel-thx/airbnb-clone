class ReservationsController < ApplicationController
  
  before_action :set_listing, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  before_action :set_reservation, only: [ :show, :user_show, :user_edit, :user_update, :destroy, :user_destroy]
  before_action :require_login, only: [:new, :create, :edit, :update, :destroy]
  
  def new
  	@reservation = Reservation.new
  end

  def create
  	@reservation = current_user.reservations.new(reservation_params)
  	@reservation.user_id = current_user.id
  	@reservation.listing_id = @listing.id

  	respond_to do |format|
      if @reservation.save
        format.html { redirect_to listing_reservation_path(@listing, @reservation.id), notice: 'Reservation was successfully created.' }
        format.json { render :show, status: :created, location: @reservation }
      else
        format.html { render :new }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    @user = current_user.id
  	# @reservation = Reservation.find(params[:id])
  end

  def user_show
  	@user = current_user.id
    @listing = Listing.find(params[:id])
  	# @reservation = Reservation.find(params[:id])
  end

  def index
  	@reservations = User.find(params[:id]).reservations.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
  end

  def user_index
  	@user = current_user.id
  	@user_reservations = User.find(params[:id]).reservations.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
  end

  def user_edit
  	@user = current_user.id
  end

  def user_update
  	@user = current_user.id
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to user_reservations_path(@user), notice: 'Your booking details have been successfully updated.' }
        # format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  def user_destroy
  	@user = current_user.id
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to user_reservations_path(@user), notice: 'Your reservation was successfully cancelled.' }
      format.json { head :no_content }
    end
  end

  private
  def set_reservation
  	@reservation = Reservation.find(params[:id])
  end

  def set_listing
    @listing = Listing.find(params[:listing_id])
  end

  def reservation_params
    params.require(:reservation).permit(:user_id, :listing_id, :start_date, :end_date, :num_of_guests)
    end

end