class User < ActiveRecord::Base
    has_secure_password

    validates :name, :presence => { :message => 'Du måste ange ditt namn.' }
    validates_uniqueness_of :email, :case_sensitive => false, :message => 'Den e-postadressen är redan upptagen.'
    validates :password, length: { minimum: 8, :message => 'Lösenordet måste vara minst 8 tecken.' }

    attr_accessor :app
end
