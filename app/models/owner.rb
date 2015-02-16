class Owner < ActiveRecord::Base
    def as_json(options={})
        super(:only => [:id, :username])
    end
end
