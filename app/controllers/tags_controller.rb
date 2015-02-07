class TagsController < ApiController
    before_filter :require_authentication

    def index
        tags = Tag.all

        return render :json => tags
    end
end
