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
        app.user_id = user.id
        app.save!

        session[:user] = user.id

        redirect_to '/apps'
    end

    def login
        user = User.find_by(email: params[:email])
        user = user.authenticate(params[:password])

        if user
            session[:user] = user.id

            redirect_to '/apps'
        else
            redirect_to '/', :notice => 'Fel användarnamn eller lösenord'
        end
    end

    def logout
        reset_session

        redirect_to '/', :notice => 'Du är utloggad'
    end
end
