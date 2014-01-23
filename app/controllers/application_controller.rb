class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

	private
	def current_user
		@current_user ||= Artist.find(session[:artist_id]) if session[:artist_id]
	rescue ActiveRecord::RecordNotFound
		    session[:artist_id] = nil
	end
end
