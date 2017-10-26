class ReservationsController < ApplicationController
  
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  before_action :require_login, only: [:new, :edit, :update, :destroy]

  
  def new
  	@reservation = Reservation.new
  end

end