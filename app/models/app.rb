class App < ActiveRecord::Base
    belongs_to :user

    validates :title, :presence => { :message => 'Du måste ge din applikation ett namn.' }
    validates :description, :presence => { :message => 'Du måste ge din applikation en beskrivning.' }

end
