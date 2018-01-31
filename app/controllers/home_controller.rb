class HomeController < ApplicationController
    def index
        @title = "Pooch Pals"
        render :index
    end
end
