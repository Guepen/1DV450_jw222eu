class TagsController < ApiController
    before_filter :require_authentication

    def index
        tags = Tag.all

        return render :json => tags
    end

    def single
        tag = Tag.find_by(id: params[:id])

        if tag
            return render :json => tag
        end

        not_found 'tag'
    end
end
