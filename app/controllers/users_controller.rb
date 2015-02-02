require 'securerandom'
require 'digest/sha2'

class UsersController < ApplicationController
    def create
        user = User.new
        user.email = params[:email]
        user.password = params[:password]
        user.save!

        app = App.new
        app.key = Digest::SHA1.new << user.email + SecureRandom.hex(8)
        app.title = params[:title]
        app.description = params[:description]
        app.user_id = user.id
        app.save!

        session[:user] = user.id

        redirect_to '/apps'
    end

    def login
        require_guest

        user = User.find_by(email: params[:email])
        if !user
            return redirect_to '/', :notice => 'Fel användarnamn eller lösenord'
        end

        user = user.authenticate(params[:password])
        if !user
            return redirect_to '/', :notice => 'Fel användarnamn eller lösenord'
        end

        session[:user] = user.id

        redirect_to '/apps'
    end

    def logout
        require_login
        reset_session

        redirect_to '/', :notice => 'Du är utloggad'
    end

    def register
        require_guest
    end
end
