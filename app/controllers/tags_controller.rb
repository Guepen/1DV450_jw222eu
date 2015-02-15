class TagsController < ApiController
    before_filter :require_authentication

    def index
        query = Tag.select('*')
        query = limit_and_offset(query)

        return render :json => query
    end

    def single
        tag = Tag.find_by(id: params[:id])

        if tag
            return render :json => tag
        end

        not_found 'tag'
    end
end
