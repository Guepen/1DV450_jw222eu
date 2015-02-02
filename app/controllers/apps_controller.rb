require 'securerandom'
require 'digest/sha2'

class AppsController < ApplicationController
    before_filter :require_login

    def create

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

            users = users.map { |user|
                app = App.find_by(user_id: user.id)

                if app
                    user.app = {
                        key: app.key,
                        title: app.title,
                        description: app.description
                    }
                end

                user
            }

            @users = users.select { |user|
                user.app != nil
            }
        else
            @app = App.find_by(user_id: user)
        end
    end

    def save
        user = session[:user]
        user = User.find_by(id: user)

        app = App.new
        app.key = Digest::SHA1.new << user.email + SecureRandom.hex(8)
        app.title = params[:title]
        app.description = params[:description]
        app.user_id = user.id

        is_valid = app.save

        if !is_valid
            return redirect_to '/apps/create', :notice => 'Alla fält måste fyllas i.'
        end

        redirect_to '/apps'
    end
end
