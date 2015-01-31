class KeysController < ApplicationController
    before_filter :require_login

    def create

    end

    def delete

    end

    def index
        if is_admin
            users = User.all

            @users = users.map { |user|
                key = Key.where(user_id: user.id).take

                user.key = key.key

                user
            }
        else
            key = Key.where(user_id: user).take
            @key = key.key
        end
    end
end
