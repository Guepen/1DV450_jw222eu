class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery

    def require_login
        if !session[:user] || !user_exists?
            reset_session

            redirect_to root_path, :notice => 'Du måste vara inloggad för att visa denna sida'
        end
    end

    def require_guest
        if session[:user] && user_exists?
            redirect_to apps_path
        end
    end

    def user_exists?
        user = User.find_by(id: session[:user])

        !!user
    end

    def is_admin
        user = session[:user]
        user = User.where(id: user).take

        if !user
            return false
        end

        user.is_admin == 1
    end
end
