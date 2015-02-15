require "yaml"

class LocationsController < ApiController
    before_filter :require_authentication

    def index
        query = Location.select('*')
        query = query.order(created_at: :desc)
        query = limit_and_offset(query)

        return render :json => query
    end

    def single
        location = Location.find_by(id: params[:id])

        if location
            return render :json => location
        end

        not_found 'location'
    end

    def search
        if !params[:q]
            return api_error(400, 'No search query')
        end

        q = params[:q]
        locations = Location.where('name LIKE :search', search: "%#{q}%")

        return render :json => locations
    end
end
