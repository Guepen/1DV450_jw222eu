class TagsController < ApiController
    before_filter :require_authentication

    def index
        data = {
            message: 'Hello World'
        }

        return render :json => data
    end
end
