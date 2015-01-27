class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery

  def require_login
    if !session[:user]
        redirect_to '/', :notice => 'Du måste vara inloggad för att visa denna sida'
    end
  end
end
