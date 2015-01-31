class KeysController < ApplicationController
    before_filter :require_login

    def create

    end

    def delete
        user = session[:user]

        if is_admin

        else
            key = Key.find_by(user_id: user)
            key.destroy
        end

        redirect_to '/keys'
    end

    def index
        user = session[:user]

        if is_admin
            users = User.all

            @users = users.map { |user|
                key = Key.find_by(user_id: user.id)

                user.key = key.key

                user
            }
        else
            @key = Key.find_by(user_id: user)
        end
    end
end
