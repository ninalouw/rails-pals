class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

    def after_sign_in_path_for(resource)
      if resource.is_a? User
        account_path
      else
        root_path
      end
  end

    private
    def redirect_signup_if_logged_in
      redirect_to account_path if current_user
    end

    def require_login
      unless current_user
        redirect_to new_user_session_path
      end
    end
end
