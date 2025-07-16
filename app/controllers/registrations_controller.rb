class RegistrationsController < Devise::RegistrationsController
    protected
  
    def after_sign_up_path_for(resource)
      root_path # ou home_path, se você tiver uma rota nomeada
    end
  end