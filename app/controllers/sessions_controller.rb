class SessionsController < ApplicationController
  
	# GET /sessions/new
  	def new
  	end

  # POST /sessions
	def create
	  artist = Artist.authenticate(:email, :password)
	    if artist
	      session[:artist_id] = artist.id
	      redirect_to root_path, notice: "Welcome back to LocalArt"
	    else
	      redirect_to :login, alert: "Invalid email or password"
	    end
	end

	def destroy
	  session[:artist_id] = nil
	  redirect_to root_path, notice: "You have been logged out"
	end
end
