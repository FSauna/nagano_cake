class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :null_session #CSRF対策

    def after_sign_in_path_for(resource)
      if resource.is_a?(Admin)
        admin_path
      else
        root_path
      end
    end


    def after_sign_out_path_for(resources)
      if resources == :admin
        new_admin_session_path
      else
        root_path
      end
    end

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name,
                                                           :first_name,
                                                           :last_name_kana,
                                                           :first_name_kana,
                                                           :email,
                                                           :postal_code,
                                                           :address,
                                                           :telephone_number])
    end
end
