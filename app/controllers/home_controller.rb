class HomeController < ApplicationController
    def index
        @title = "Pooch Pals"
        render :index
    end

    def dashboard
        render :dashboard
    end
end
