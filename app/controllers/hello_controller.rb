class HelloController < ApplicationController

	def index

		# @listings = Listing.all
		@listings =Listing.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
		#render :index, layout: false
		#"layout: false" if you want to not include application.html.erb
	end

end
