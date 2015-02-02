class User < ActiveRecord::Base
    has_secure_password

    validates :password, length: { minimum: 8 }, allow_nil: true

    attr_accessor :app
end
