require 'securerandom'
require 'digest/sha2'

class UsersController < ApplicationController
    def create
        flash[:fields] = params

        user = User.new
        user.name = params[:name]
        user.email = params[:email]
        user.password = params[:password]

        user.validate()
        errors = user.errors

        app = App.new
        app.key = Digest::SHA1.new << user.email + SecureRandom.hex(8)
        app.title = params[:title]
        app.description = params[:description]

        app.validate()
        app.errors.each do |attr, error|
            errors.add(attr, error)
        end

        if errors.size() > 0
            flash[:notice] = errors

            return redirect_to register_path
        else
            user.save

            app.user_id = user.id
            app.save
        end

        session[:user] = user.id

        redirect_to '/apps'
    end

    def login
        require_guest

        flash[:fields] = params

        user = User.find_by(email: params[:email])
        if !user
            return redirect_to root_path, :notice => 'Fel användarnamn eller lösenord.'
        end

        user = user.authenticate(params[:password])
        if !user
            return redirect_to root_path, :notice => 'Fel användarnamn eller lösenord.'
        end

        session[:user] = user.id

        redirect_to apps_path
    end

    def logout
        require_login
        reset_session

        redirect_to root_path, :notice => 'Du är utloggad.'
    end

    def register
        require_guest
    end

    def settings
        require_login

        @user = User.find_by(id: session[:user])
    end

    def update
        require_login

        user = User.find_by(id: session[:user])
        user.name = params[:name]
        user.email = params[:email]

        if params[:password]
            user.password = params[:password]
        end

        is_valid = user.save

        if !is_valid
            flash[:notice] = user.errors
            flash[:fields] = params

            return redirect_to users_settings_path
        end

        redirect_to users_settings_path, alert: 'Dina inställningar är uppdaterade.'
    end
end
