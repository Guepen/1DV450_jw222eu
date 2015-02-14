class Location < ActiveRecord::Base
    belongs_to :position

    def as_json(options={})
        super(:only => [:id, :name, :position_id])
    end
end
