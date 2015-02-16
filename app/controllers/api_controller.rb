class ApiController < ApplicationController
    helper_method :require_key

    def require_authentication

    end

    def require_key
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

    def limit_and_offset(query)
        if params[:limit]
            query = query.limit(params[:limit])
        end

        if params[:offset]
            query = query.offset(params[:offset])
        end

        query
    end
end
