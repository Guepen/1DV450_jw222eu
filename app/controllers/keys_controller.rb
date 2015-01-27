class KeysController < ApplicationController
    before_filter :require_login

    def index
        user = session[:user]

        @key = Key.where(user_id: user).take
    end
end
