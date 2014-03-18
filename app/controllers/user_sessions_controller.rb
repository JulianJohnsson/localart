class UserSessionsController < ApplicationController

	# GET /sessions/new
  	def new
  		@user = User.new
  	end

  # POST /sessions
	def create
	  if @user = login(params[:email], params[:password])
	  	redirect_back_or_to(:users, :notice => "Logged in !")
	  else
	  	flash.now[:alert] = "Login failed"
	  	render action: "new"
	  end
	end

	def destroy
	  logout
	  redirect_to root_url, :notice => "You have been logged out."
	end

	private

	#def set_user
	#	@artist = login(params[:sessions][:email], params[:sessions][:password])
	#end

	def sessions_params
		params.require(:user).permit(:email, :password)
	end

end
