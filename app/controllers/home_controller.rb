class HomeController < ApplicationController
    def index
        require_guest
    end
end
