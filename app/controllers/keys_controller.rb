class KeysController < ApplicationController
    before_filter :require_login

    def create

    end

    def delete

    end

    def index
        if is_admin
            @keys = Key.all
        else
            key = Key.where(user_id: user).take
            @key = key.key
        end
    end
end
