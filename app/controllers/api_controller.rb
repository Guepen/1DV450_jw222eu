class ApiController < ApplicationController
    helper_method :require_authentication

    def require_authentication
        status = 401

        if !params[:api_key]
            error = {
                status: status,
                message: 'No api key provided.'
            }

            return render :json => error, :status => status
        end

        app = App.find_by(key: params[:api_key])
        if !app
            error = {
                status: status,
                message: 'Invalid api key provided.'
            }

            return render :json => error, :status => status
        end
    end

    def not_found
        error = {
            status: 404,
            message: 'Requested resource not found.'
        }

        return render :json => error, :status => status
    end
end
