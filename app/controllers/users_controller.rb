class UsersController < ApplicationController
    # POST /users/login & /login
    def login
        user = User.where(
            :email => params[:email]
        )

        if user.exists?
            user = user[0]

            hash = params[:password].crypt(user[:salt]);
            if user[:password] == hash
                session[:user] = user[:id]

                redirect_to '/keys'
            else
                redirect_to '/', :notice => 'Fel användarnamn eller lösenord'
            end
        else
            redirect_to '/', :notice => 'Fel användarnamn eller lösenord'
        end
    end

    def logout
        reset_session

        redirect_to '/', :notice => 'Du är utloggad'
    end
end
