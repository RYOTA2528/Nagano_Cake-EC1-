class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    def after_sign_in_path_for(resource)
      #byebug
      if current_admin
        admin_root_path
      else current_customer
        root_path
      end
    end

    def after_sign_out_path_for(resource)
      if current_admin
        new_admin_session_path
      else current_customer
        root_path
      end

    protected

    def configure_permitted_parameters
    added_attrs = [ :last_name, :first_name,  :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email, :encrypted_password ]
    devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs )
    end
    # before_action :configure_permitted_parameters, if: :devise_controller?


    # def configure_permitted_parameters
    # devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    # end



end



