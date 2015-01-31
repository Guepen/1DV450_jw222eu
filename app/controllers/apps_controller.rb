require 'securerandom'
require 'digest/sha2'

class AppsController < ApplicationController
    before_filter :require_login

    def create
        user = session[:user]
        user = User.find_by(id: user)

        app = App.new
        app.key = Digest::SHA1.new << user.email + SecureRandom.hex(8)
        app.user_id = user.id
        app.save!

        redirect_to '/apps'
    end

    def delete
        user = session[:user]

        if is_admin
            app = App.find_by(key: params[:key])

            if app
                app.destroy
            end
        else
            app = App.find_by(user_id: user)
            app.destroy
        end

        redirect_to '/apps'
    end

    def index
        user = session[:user]

        if is_admin
            users = User.all

            @users = users.map { |user|
                app = App.find_by(user_id: user.id)

                if app
                    user.key = app.key
                end

                user
            }
        else
            @app = App.find_by(user_id: user)
        end
    end
end
