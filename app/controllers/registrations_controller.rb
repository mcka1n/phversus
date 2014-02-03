class RegistrationsController < Devise::RegistrationsController

  def after_sign_up_path_for(resource)
    '/after_signup'
  end

end
