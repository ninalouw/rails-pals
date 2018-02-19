class UsersController < ApplicationController
    before_action :redirect_signup_if_logged_in, only: [:new]
    before_action :require_login, only: [:show, :edit]
    def new
        # @token = form_authenticity_token
        @title = "Sign Up"
    end

    def show
        @user = current_user
        @title = "Profile"
        render :show
    end

end
