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

    def is_admin
        user = session[:user]
        user = User.where(id: user).take

        if !user
            return false
        end

        user.is_admin == 1
    end
end
