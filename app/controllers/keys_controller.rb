class KeysController < ApplicationController
    before_filter :require_login

    def index
        user = session[:user]

        user = User.where(id: user).take

        if user.is_admin
            @keys = Key.all
        else
            key = Key.where(user_id: user).take
            @key = key.key
        end
    end
end
