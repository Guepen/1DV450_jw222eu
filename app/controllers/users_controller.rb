class UsersController < ApplicationController
    # POST /users/login & /login
    def login
        user = User.where(email: params[:email]).take
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
