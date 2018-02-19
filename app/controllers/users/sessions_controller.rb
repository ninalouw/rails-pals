# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
    before_action :redirect_signup_if_logged_in, only: [:new]
    before_action :require_login, only: [:show, :edit]
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  def create
    super
    session[:logged_out] = nil
    session[:returning] = true
  end

  # DELETE /resource/sign_out
  def destroy
    super
    session[:logged_out] = true
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
