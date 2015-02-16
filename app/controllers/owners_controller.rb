class OwnersController < ApiController
    before_filter :require_authentication

    def index
        query = Owner.select('*')
        query = limit_and_offset(query)

        return render :json => query
    end

    def single
        owner = Owner.find_by(id: params[:id])

        if owner
            return render :json => owner
        end

        not_found 'owner'
    end

    def locations
        owner = Owner.find_by(id: params[:id])
        if !owner
            return not_found 'owner'
        end

        query = Location.select('*')
        query = limit_and_offset(query)
        query = query.where(owner_id: params[:id])

        return render :json => query
    end
end
