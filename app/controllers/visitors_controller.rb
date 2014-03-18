class VisitorsController < ApplicationController

  	def new
		@visitor = Visitor.new
		render 'visitors/new', :layout => 'special'
	end

	def create
		@visitor = Visitor.new(secure_params) 
		if @visitor.valid?
			@visitor.subscribe
			flash[:notice] = "Signed up #{@visitor.email} successfully." 
			redirect_to root_path
		else
			render :new
		end 
	end

	def show
	end

	private

	def secure_params 
		params.require(:visitor).permit(:email)
	end 
end
