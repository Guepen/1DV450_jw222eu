class KeysController < ApplicationController
    before_filter :require_login

    def create

    end

    def delete
        user = session[:user]

        if is_admin
            key = Key.find_by(key: params[:key])

            if key
                key.destroy
            end
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

                if key
                    user.key = key.key
                end

                user
            }
        else
            @key = Key.find_by(user_id: user)
        end
    end
end
