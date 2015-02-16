class Location < ActiveRecord::Base
    belongs_to :owner, :position

    def as_json(options={})
        super(:only => [:id, :name, :position_id, :owner_id])
    end
end
