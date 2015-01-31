require 'securerandom'
require 'digest/sha2'

class UsersController < ApplicationController
    def create
        user = User.new
        user.email = params[:email]
        user.password = params[:password]
        user.save!

        key = Key.new
        key.key = Digest::SHA1.new << params[:email] + SecureRandom.hex(8)
        key.user_id = user.id
        key.save!

        session[:user] = user.id

        redirect_to '/keys'
    end

    # POST /users/login & /login
    def login
        user = User.find_by(email: params[:email])
        user = user.authenticate(params[:password])

        if user
            session[:user] = user.id

            redirect_to '/keys'
        else
            redirect_to '/', :notice => 'Fel användarnamn eller lösenord'
        end
    end

    def logout
        reset_session

        redirect_to '/', :notice => 'Du är utloggad'
    end
end
