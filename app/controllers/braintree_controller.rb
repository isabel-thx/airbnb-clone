class BraintreeController < ApplicationController
  
  def new
  	@client_token = Braintree::ClientToken.generate
  	# generate the token in the controller and embed it in JavaScript
  	@reservation = Reservation.find(params[:id])

  end

  def create
  	# make the payment
  	# find the reservation and update to true
  	@reservation = Reservation.find(params[:id])
    @user = current_user

  	nonce_from_the_client = params[:checkout_form][:payment_method_nonce]

  	result = Braintree::Transaction.sale(
  	:amount => @reservation.total_amount,
  	:payment_method_nonce => nonce_from_the_client,
  	:options => {
      :submit_for_settlement => true
    }
   )

  	if result.success?

  		if @reservation.update(paid: true)

    	 redirect_to user_reservations_path(@user), :flash => { :success => "Transaction successful!" }
      end      
  	else
    	redirect_to root_path, :flash => { :error => "Transaction failed. Please try again." }
 		end
  end



end





