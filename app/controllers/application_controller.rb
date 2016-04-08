class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate_admin!
    unless current_user && current_user.admin
      flash[:warning] = "Restricted Access"
      redirect_to '/'
    end
  end
end
