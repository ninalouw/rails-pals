class Users::SessionsController < Devise::SessionsController
#   skip_before_filter :verify_authenticity_token
  def new
    @title = 'Log In'
    self.resource = resource_class.new(sign_in_params)
  end

end
