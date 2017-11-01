class HelloController < ApplicationController

	def index

		# @listings = Listing.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)


			if params[:location]
				@listings = Listing.search(location: params[:location], guest: params[:guest], start_date: params[:start_date], end_date: params[:end_date]).order("created_at DESC").paginate(:page => params[:page], :per_page => 9)
	  	else
	    	@listings = Listing.order("created_at DESC").paginate(:page => params[:page], :per_page => 9)
	  	end

	end
		#render :index, layout: false
		#"layout: false" if you want to not include application.html.erb


end
