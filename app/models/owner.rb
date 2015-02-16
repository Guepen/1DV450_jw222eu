class Owner < ActiveRecord::Base
    has_secure_password

    def as_json(options={})
        super(:only => [:id, :username])
    end
end
