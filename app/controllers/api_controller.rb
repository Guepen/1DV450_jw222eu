class ApiController < ApplicationController
    helper_method :require_authentication

    def require_authentication
        status = 401

        if !params[:api_key]
            return api_error(status, 'No api key provided.')
        end

        app = App.find_by(key: params[:api_key])
        if !app
            return api_error(status, 'Invalid api key provided.')
        end
    end

    def api_error(status, message)
        error = {
            status: status,
            message: message
        }

        render :json => error, :status => status
    end

    def not_found(type)
        api_error(404, 'Requested ' + type + ' not found.')
    end
end
