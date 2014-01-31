class ArtistSessionsController < ApplicationController

	# GET /sessions/new
  	def new
  		@artist = Artist.new
  	end

  # POST /sessions
	def create
	  if @artist = login(params[:email], params[:password])
	  	redirect_back_or_to(:artists, :notice => "Logged in !")
	  else
	  	flash.now[:alert] = "Login failed"
	  	render action: "new"
	  end
	end

	def destroy
	  logout
	  redirect_to root_url, :notice => "You have been logged out."
	end

	#private

	#def set_user
	#	@artist = login(params[:sessions][:email], params[:sessions][:password])
	#end

	#def sessions_params
	#	params.require(:artist).permit(:email, :password)
	#end

end
