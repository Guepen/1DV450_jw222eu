class LocationsController < ApiController
    before_filter :require_authentication

    def index
        tags = Location.all

        return render :json => tags
    end

    def single
        tag = Location.find_by(id: params[:id])

        if tag
            return render :json => tag
        end

        not_found
    end
end
