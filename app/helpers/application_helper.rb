module ApplicationHelper
    def is_signed_in?
        !!session[:user]
    end

    def get_field(field)
        if flash[:fields]
            fields = flash[:fields]
        else
            fields = {}
        end

        fields[field]
    end
end
